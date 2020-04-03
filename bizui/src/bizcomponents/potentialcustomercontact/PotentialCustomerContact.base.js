import React from 'react'
import { Icon,Divider, Avatar, Card, Col, Tag} from 'antd'

import { Link } from 'dva/router'
import moment from 'moment'
import ImagePreview from '../../components/ImagePreview'
import appLocaleName from '../../common/Locale.tool'
import BaseTool from '../../common/Base.tool'
import GlobalComponents from '../../custcomponents'
import DescriptionList from '../../components/DescriptionList'
const { Description } = DescriptionList
import styles from './PotentialCustomerContact.base.less'
const {
	defaultRenderReferenceCell,
	defaultRenderBooleanCell,
	defaultRenderMoneyCell,
	defaultRenderDateTimeCell,
	defaultRenderImageCell,
	defaultRenderAvatarCell,
	defaultRenderDateCell,
	defaultRenderIdentifier,
	defaultRenderTextCell,
	defaultSearchLocalData,
} = BaseTool

const renderTextCell=defaultRenderTextCell
const renderIdentifier=defaultRenderIdentifier
const renderDateCell=defaultRenderDateCell
const renderDateTimeCell=defaultRenderDateTimeCell
const renderImageCell=defaultRenderImageCell
const renderAvatarCell=defaultRenderAvatarCell
const renderMoneyCell=defaultRenderMoneyCell
const renderBooleanCell=defaultRenderBooleanCell
const renderReferenceCell=defaultRenderReferenceCell



const menuData = {menuName: window.trans('potential_customer_contact'), menuFor: "potentialCustomerContact",
  		subItems: [
  
  		],
}


const settingMenuData = {menuName: window.trans('potential_customer_contact'), menuFor: "potentialCustomerContact",
  		subItems: [
  
  		],
}

const fieldLabels = {
  id: window.trans('potential_customer_contact.id'),
  name: window.trans('potential_customer_contact.name'),
  contactDate: window.trans('potential_customer_contact.contact_date'),
  contactMethod: window.trans('potential_customer_contact.contact_method'),
  potentialCustomer: window.trans('potential_customer_contact.potential_customer'),
  cityPartner: window.trans('potential_customer_contact.city_partner'),
  contactTo: window.trans('potential_customer_contact.contact_to'),
  description: window.trans('potential_customer_contact.description'),
  lastUpdateTime: window.trans('potential_customer_contact.last_update_time'),

}

const displayColumns = [
  { title: fieldLabels.id, debugtype: 'string', dataIndex: 'id', width: '8', render: (text, record)=>renderTextCell(text,record,'potentialCustomerContact') , sorter: true },
  { title: fieldLabels.name, debugtype: 'string', dataIndex: 'name', width: '14',render: (text, record)=>renderTextCell(text,record)},
  { title: fieldLabels.contactDate, dataIndex: 'contactDate', render: (text, record) =>renderDateCell(text,record), sorter: true },
  { title: fieldLabels.contactMethod, debugtype: 'string', dataIndex: 'contactMethod', width: '8',render: (text, record)=>renderTextCell(text,record)},
  { title: fieldLabels.potentialCustomer, dataIndex: 'potentialCustomer', render: (text, record) => renderReferenceCell(text, record), sorter:true},
  { title: fieldLabels.cityPartner, dataIndex: 'cityPartner', render: (text, record) => renderReferenceCell(text, record), sorter:true},
  { title: fieldLabels.contactTo, dataIndex: 'contactTo', render: (text, record) => renderReferenceCell(text, record), sorter:true},
  { title: fieldLabels.description, debugtype: 'string', dataIndex: 'description', width: '10',render: (text, record)=>renderTextCell(text,record)},
  { title: fieldLabels.lastUpdateTime, dataIndex: 'lastUpdateTime', render: (text, record) =>renderDateTimeCell(text,record), sorter: true},

]


const searchLocalData =(targetObject,searchTerm)=> defaultSearchLocalData(menuData,targetObject,searchTerm)
const colorList = ['#f56a00', '#7265e6', '#ffbf00', '#00a2ae'];
let counter = 0;
const genColor=()=>{
	counter++;
	return colorList[counter%colorList.length];
}
const followColor=()=>{
	return 'green';
	// return colorList[counter%colorList.length];
}
const leftChars=(value, left)=>{
	const chars = left || 4
	if(!value){
		return "N/A"
	}
	return value.substring(0,chars);
}
const renderItemOfList=(potentialCustomerContact, targetComponent, columCount)=>{
  const displayColumnsCount = columCount || 4
  const userContext = null
  return (
    <Card key={potentialCustomerContact.id} style={{marginTop:"10px"}}>
		
	<Col span={4}>
		<Avatar size={90} style={{ backgroundColor: genColor(), verticalAlign: 'middle' }}>
			{leftChars(potentialCustomerContact.displayName)}
		</Avatar>
	</Col>
	<Col span={20}>
	  
	  
	 
	
      <DescriptionList  key={potentialCustomerContact.id} size="small" col={displayColumnsCount} >
        <Description term={fieldLabels.id} style={{wordBreak: 'break-all'}}>{potentialCustomerContact.id}</Description> 
        <Description term={fieldLabels.name} style={{wordBreak: 'break-all'}}>{potentialCustomerContact.name}</Description> 
        <Description term={fieldLabels.contactDate}><div>{ moment(potentialCustomerContact.contactDate).format('YYYY-MM-DD')}</div></Description> 
        <Description term={fieldLabels.contactMethod} style={{wordBreak: 'break-all'}}>{potentialCustomerContact.contactMethod}</Description> 
        <Description term={fieldLabels.potentialCustomer}><Tag color='blue' title={`${potentialCustomerContact.potentialCustomer.id}-${potentialCustomerContact.potentialCustomer.displayName}`}>{potentialCustomerContact.potentialCustomer==null?appLocaleName(userContext,"NotAssigned"):`${leftChars(potentialCustomerContact.potentialCustomer.displayName,15)}`}
        </Tag></Description>
        <Description term={fieldLabels.cityPartner}><Tag color='blue' title={`${potentialCustomerContact.cityPartner.id}-${potentialCustomerContact.cityPartner.displayName}`}>{potentialCustomerContact.cityPartner==null?appLocaleName(userContext,"NotAssigned"):`${leftChars(potentialCustomerContact.cityPartner.displayName,15)}`}
        </Tag></Description>
        <Description term={fieldLabels.contactTo}><Tag color='blue' title={`${potentialCustomerContact.contactTo.id}-${potentialCustomerContact.contactTo.displayName}`}>{potentialCustomerContact.contactTo==null?appLocaleName(userContext,"NotAssigned"):`${leftChars(potentialCustomerContact.contactTo.displayName,15)}`}
        </Tag></Description>
        <Description term={fieldLabels.description} style={{wordBreak: 'break-all'}}>{potentialCustomerContact.description}</Description> 
        <Description term={fieldLabels.lastUpdateTime}><div>{ moment(potentialCustomerContact.lastUpdateTime).format('YYYY-MM-DD HH:mm')}</div></Description> 
	
        
      </DescriptionList>
     </Col>
    </Card>
	)

}
	
const packFormValuesToObject = ( formValuesToPack )=>{
	const {name, contactDate, contactMethod, description, potentialCustomerId, cityPartnerId, contactToId} = formValuesToPack
	const potentialCustomer = {id: potentialCustomerId, version: 2^31}
	const cityPartner = {id: cityPartnerId, version: 2^31}
	const contactTo = {id: contactToId, version: 2^31}
	const data = {name, contactDate:moment(contactDate).valueOf(), contactMethod, description, potentialCustomer, cityPartner, contactTo}
	return data
}
const unpackObjectToFormValues = ( objectToUnpack )=>{
	const {name, contactDate, contactMethod, description, potentialCustomer, cityPartner, contactTo} = objectToUnpack
	const potentialCustomerId = potentialCustomer ? potentialCustomer.id : null
	const cityPartnerId = cityPartner ? cityPartner.id : null
	const contactToId = contactTo ? contactTo.id : null
	const data = {name, contactDate:moment(contactDate), contactMethod, description, potentialCustomerId, cityPartnerId, contactToId}
	return data
}
const stepOf=(targetComponent, title, content, position, index)=>{
	return {
		title,
		content,
		position,
		packFunction: packFormValuesToObject,
		unpackFunction: unpackObjectToFormValues,
		index,
      }
}
const PotentialCustomerContactBase={menuData,settingMenuData,displayColumns,fieldLabels,renderItemOfList, stepOf, searchLocalData}
export default PotentialCustomerContactBase

