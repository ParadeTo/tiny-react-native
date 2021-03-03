import RNManager from './RNManager'
import Reconciler from 'react-reconciler'

const HostConfig = {
  // 通过 FiberNode 创建 instance，会保存在 FiberNode 的 stateNode 属性上
  // 参考 http://www.paradeto.com/react-render/
  createInstance: function (
    type,
    newProps,
    rootContainerInstance,
    currentHostContext,
    workInProgress
  ) {
    console.log(type)
    // let element
    // switch (type) {
    //   case 'rect':
    //     element = new Rect(newProps)
    //     break
    //   case 'circle':
    //     element = new Circle(newProps)
    //     break
    //   case 'text':
    //     element = new Text(newProps)
    //     break
    //   default:
    //     break
    // }
    return
  },
  /* 操作子组件 */
  appendInitialChild(parent, child) {
    parent.appendChild(child)
    debugger
  },
  appendChildToContainer(parent, child) {
    parent.appendChild(child)
    debugger
  },
  appendChild: function (parent, child) {
    parent.appendChild(child)
  },
  insertBefore(parent, child, beforeChild) {
    parent.insertBefore(child, beforeChild)
  },
  removeChild(parent, child) {
    parent.removeChild(child)
  },

  /* FiberNode 的属性发生变化时会调用该方法 */
  commitUpdate: function (
    instance,
    updatePayload,
    type,
    oldProps,
    newProps,
    finishedWork
  ) {
    instance.update(newProps)
  },

  // react 流程结束后，调用此方法，我们可以在这里触发我们的渲染器重新渲染
  // 此处参考 remax：https://github.com/remaxjs/remax/blob/80606f640b08c79b9fc61d52a03355f0282c5e14/packages/remax-runtime/src/hostConfig/index.ts#L63
  resetAfterCommit: function (rootContainerInstance) {
    rootContainerInstance.render()
  },

  getRootHostContext(nextRootInstance) {
    const rootContext = {}
    return rootContext
  },
  getChildHostContext: function (parentContext, fiberType, rootInstance) {
    const context = {}
    return context
  },
  prepareForCommit: function (rootContainerInstance) {
    return null
  },
  prepareUpdate(
    instance,
    type,
    oldProps,
    newProps,
    rootContainerInstance,
    currentHostContext
  ) {
    return {}
  },
  supportsMutation: true,

  // 暂时不需要的接口
  finalizeInitialChildren: function () {},
  appendAllChildren(...args) {},
  commitTextUpdate: function (textInstance, oldText, newText) {},

  removeChildFromContainer(container, child) {},
  commitMount: (domElement, type, newProps, fiberNode) => {},
  clearContainer(...args) {},
  createTextInstance: function (
    newText,
    rootContainerInstance,
    currentHostContext,
    workInProgress
  ) {},
  shouldSetTextContent: function (...args) {},
}
debugger
const reconcilerInstance = Reconciler(HostConfig)

const CanvasRenderer = {
  render(element, renderDom, callback) {
    const root = RNManager.createRoot(renderDom)
    const isAsync = false // Disables async rendering
    const container = reconcilerInstance.createContainer(root, isAsync) // Creates root fiber node.
    const parentComponent = null // Since there is no parent (since this is the root fiber). We set parentComponent to null.

    reconcilerInstance.updateContainer(
      element,
      container,
      parentComponent,
      callback
    ) // Start reconcilation and render the result
  },
}

export default CanvasRenderer
export {default as View} from './View'
