// DOM 元素
const themeSelect = document.getElementById('themeSelect');
const downloadBtn = document.getElementById('downloadBtn');
const progressSection = document.getElementById('progressSection');
const progressLabel = document.getElementById('progressLabel');
const progressPercent = document.getElementById('progressPercent');
const progressFill = document.getElementById('progressFill');
const currentStep = document.getElementById('currentStep');
const completeSection = document.getElementById('completeSection');
const resetBtn = document.getElementById('resetBtn');

// 模拟的处理步骤
const processSteps = [
    { label: '下载模板文件', duration: 1500, progress: 15 },
    { label: '下载主图标包', duration: 2000, progress: 35 },
    { label: '下载主题图标包', duration: 1800, progress: 55 },
    { label: '解压图标资源', duration: 1200, progress: 70 },
    { label: '合并图标文件', duration: 1500, progress: 85 },
    { label: '生成 Magisk 模块', duration: 1000, progress: 100 }
];

// 启用/禁用下载按钮
themeSelect.addEventListener('change', function() {
    downloadBtn.disabled = !this.value;
});

// 下载按钮点击事件
downloadBtn.addEventListener('click', startProcess);

// 重置按钮点击事件
resetBtn.addEventListener('click', resetProcess);

// 开始处理流程
async function startProcess() {
    // 隐藏下载按钮，显示进度条
    downloadBtn.style.display = 'none';
    progressSection.style.display = 'block';
    
    // 禁用主题选择
    themeSelect.disabled = true;
    
    // 执行各个步骤
    for (let i = 0; i < processSteps.length; i++) {
        const step = processSteps[i];
        await executeStep(step, i + 1, processSteps.length);
    }
    
    // 显示完成状态
    setTimeout(() => {
        progressSection.style.display = 'none';
        completeSection.style.display = 'block';
        
        // 模拟下载文件
        simulateDownload();
    }, 500);
}

// 执行单个步骤
function executeStep(step, stepNumber, totalSteps) {
    return new Promise(resolve => {
        progressLabel.textContent = `步骤 ${stepNumber}/${totalSteps}`;
        currentStep.textContent = step.label;
        
        // 使用动画平滑更新进度
        animateProgress(step.progress, step.duration);
        
        setTimeout(resolve, step.duration);
    });
}

// 动画更新进度条
function animateProgress(targetProgress, duration) {
    const startProgress = parseInt(progressFill.style.width) || 0;
    const increment = (targetProgress - startProgress) / (duration / 50);
    
    const interval = setInterval(() => {
        const currentProgress = parseInt(progressFill.style.width) || 0;
        const newProgress = Math.min(currentProgress + increment, targetProgress);
        
        progressFill.style.width = newProgress + '%';
        progressPercent.textContent = Math.round(newProgress) + '%';
        
        if (newProgress >= targetProgress) {
            clearInterval(interval);
        }
    }, 50);
}

// 模拟文件下载
function simulateDownload() {
    // 创建虚拟文件内容
    const moduleContent = {
        theme: themeSelect.value,
        timestamp: new Date().toISOString(),
        files: [
            'META-INF/com/google/android/update-binary',
            'META-INF/com/google/android/updater-script',
            'customize.sh',
            'module.prop',
            'post-fs-data.sh',
            'icons'
        ]
    };
    
    // 创建 Blob 和下载链接
    const blob = new Blob([JSON.stringify(moduleContent, null, 2)], 
                         { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    
    // 创建隐藏的下载链接
    const a = document.createElement('a');
    a.href = url;
    a.download = `perfect-icons-${themeSelect.value}-magisk.zip`;
    
    // 触发下载
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    
    // 清理 URL
    setTimeout(() => URL.revokeObjectURL(url), 100);
}

// 重置流程
function resetProcess() {
    // 重置界面状态
    completeSection.style.display = 'none';
    downloadBtn.style.display = 'flex';
    progressSection.style.display = 'none';
    
    // 重置进度
    progressFill.style.width = '0%';
    progressPercent.textContent = '0%';
    
    // 重新启用控件
    themeSelect.disabled = false;
    themeSelect.value = '';
    downloadBtn.disabled = true;
}

// 添加一些视觉效果
document.addEventListener('DOMContentLoaded', () => {
    // 添加悬浮效果
    const cards = document.querySelectorAll('.main-card, .info-card');
    
    cards.forEach(card => {
        card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;
            
            const rotateX = (y - centerY) / 20;
            const rotateY = (centerX - x) / 20;
            
            card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
        });
        
        card.addEventListener('mouseleave', () => {
            card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0)';
        });
    });
});