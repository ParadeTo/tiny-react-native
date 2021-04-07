import {View} from './react-native'

function App() {
  return (
    <View x={20} y={20} w={100} h={100} r={255} g={0} b={0} a={1}>
      <View x={0} y={0} w={50} h={50} r={0} g={255} b={0} a={1}></View>
    </View>
  )
}

export default App
