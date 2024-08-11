const { contextBridge } = require('electron')
const shell=require('electron').shell
contextBridge.exposeInMainWorld('versions', {
  node: () => process.versions.node,
  chrome: () => process.versions.chrome,
  electron: () => process.versions.electron,
  // we can also expose variables, not just functions
})

shell.openPath('C:/Users/ASUS/OneDrive/Desktop/techshila/Techshilla-RemotePC/desktop/src/assets/getIp.sh')


console.log("hello")

