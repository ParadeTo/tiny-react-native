import {View} from './react-native'
import {useEffect, useState} from 'react'

const W = 100
const innerW = 50

function App() {
  const [x, setX] = useState(0)
  // const [y, setY] = useState(0)
  useEffect(() => {
    setTimeout(() => {
      // if (y === 0 && x < W - innerW) {
      //   setX(x + 1)
      // } else if (x === W - innerW && y < W - innerW) {
      //   setY(y + 1)
      // } else if (y === W - innerW && x > 0) {
      //   setX(x - 1)
      // } else {
      //   setY(y - 1)
      // }

      setX(20)
    }, 2000)
  }, [])
  return (
    <View x={20} y={20} w={W} h={W} r={255} g={0} b={0} a={1}>
      <View x={x} y={10} w={innerW} h={innerW} r={0} g={255} b={0} a={1}></View>
    </View>
  )
}

export default App
