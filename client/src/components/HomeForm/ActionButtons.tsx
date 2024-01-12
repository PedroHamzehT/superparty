import useHomeContext from "./useHomeContext"

interface ActionButtonsProps {
  currentType: 'login' | 'register' | 'passwordless'
}

const ActionButtons = ({ currentType }: ActionButtonsProps) => {
  const { handleSignTypeChange } = useHomeContext()

  return (
    <div className='flex justify-end gap-3'>
      {currentType !== 'login' && <button type="button" className='p-2 rounded-md border mt-5' onClick={() => handleSignTypeChange('login')}>Log in</button>}
      {currentType !== 'register' && <button type="button" className='p-2 rounded-md border mt-5' onClick={() => handleSignTypeChange('register')}>Register</button>}
      {currentType !== 'passwordless' && <button type="button" className='p-2 rounded-md border mt-5' onClick={() => handleSignTypeChange('passwordless')}>Passwordless Log in</button>}
    </div>
  )
}

export default ActionButtons
