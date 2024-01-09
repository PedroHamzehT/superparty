import { useContext } from "react"
import { FormActionTypes, HomeContext } from "./HomeContext"

const useHomeContext = () => {
  const context = useContext(HomeContext)

  if (context === undefined) {
    throw new Error('useHomeContext must be used within a HomeContextProvider')
  }

  const { formState, formDispatch } = context

  const handleFormChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    switch (e.target.name) {
      case 'name':
        formDispatch({type: FormActionTypes.CHANGE_NAME, payload: e.target.value})
        break
      case 'email':
        formDispatch({type: FormActionTypes.CHANGE_EMAIL, payload: e.target.value})
        break
      case 'password':
        formDispatch({type: FormActionTypes.CHANGE_PASSWORD, payload: e.target.value})
        break
      case 'confirm_password':
        formDispatch({type: FormActionTypes.CHANGE_CONFIRM_PASSWORD, payload: e.target.value})
        break
      default:
        throw Error('Unknown input name')
    }
  }

  const handleSignTypeChange = (value: string) => {
    formDispatch({type: FormActionTypes.CHANGE_SIGN_TYPE, payload: value})
  }

  return { formState, handleFormChange, handleSignTypeChange }
}

export default useHomeContext
