import useHomeContext from "./useHomeContext";

const SignUp = () => {
  const { formState, handleFormChange, handleSignTypeChange } = useHomeContext()

  return (
    <form className="mt-5">
      <div className='grid grid-cols-2 gap-4'>
        <input name="name" onChange={handleFormChange} value={formState.name} type="text" placeholder='Type your name' className='border border-gray-300 p-2 rounded-md'/>
        <input name="email" onChange={handleFormChange} value={formState.email} type="email" placeholder='Type your email' className='border border-gray-300 p-2 rounded-md'/>
        <input name="password" onChange={handleFormChange} value={formState.password} type="password" placeholder='Type your password' className='border border-gray-300 p-2 rounded-md'/>
        <input name="confirm_password" onChange={handleFormChange} value={formState.confirm_password} type="password" placeholder='Confirm your password' className='border border-gray-300 p-2 rounded-md'/>
      </div>

      <div className='flex justify-end gap-3'>
        <button type='submit' className='bg-primary-yellow text-white p-2 rounded-md mt-5'>Sign up</button>
        <button type="button" className='p-2 rounded-md border mt-5' onClick={() => handleSignTypeChange('login')}>Log in</button>
      </div>
    </form>
  );
}

export default SignUp
