Return-Path: <linux-doc+bounces-88343-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMmgGp71C2r0SAUAu9opvQ
	(envelope-from <linux-doc+bounces-88343-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 07:31:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF6577739
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 07:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CE293021261
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 05:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056A925D527;
	Tue, 19 May 2026 05:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p7EbI5Hr"
X-Original-To: linux-doc@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1838210F2;
	Tue, 19 May 2026 05:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168667; cv=fail; b=eVt1JAyIxszTbDDkst06PiUxOkvokLwV03oyAfdGf5iltRAva8hK4baOa7X7+drGyod0Ldk6KD2enzveEbUS9KPYA1+DyEoMEf/nxQJvsicTJKN9kcxcojRjmXqctNioaG0ScFkobyX6jnbWXGWDyIY86bwDVO23Lopz628AkeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168667; c=relaxed/simple;
	bh=EouU2E0vAamODDAQcDcVKpJPHs2rscSijKR38hg3+k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ks0X7l6n59PNOkCgn840YXl1qf/S0tCeFqKKJdhIf6Zb8gpMLCGJhiMpfuXhsRJ7GuiSZkFa3elUHIGGIqbRRzHdGzCQI4s0Do0LpTJD2T2cv/R2Hd8iOMQOBRYZBU8hukXWaMi1fLFE+OGWjwl0OCA9IckFtbbGI+NalQcmuXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p7EbI5Hr; arc=fail smtp.client-ip=40.93.198.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdT9rht4iYNf4r3tDJM9KR1mtG4x+TJdvPH4WvcgX3UznICxDm9inU1ZEE1kSgplPh9rCwTb4o7YTsABuiv+hF/+lgIYfLjUv0kRZ81K1zPjAvqoOFMlvi4XIDt5E5oN1ppUXGrF7lMWyc6h4YDXxYAARBduv0zZ12Uqtm/b37TppFdtLfHdhOvTU+l32NBvIMARiYbTGf3Jy/BShjxbhg+n/Vbg2helhV77vCfreE50tqebDmKuxUJljNkB8pmjaRRT/Ja/2NcS9n7H+GZQUIEcMH5c2GMCQRmW9+ZUkVE+EDxTMcGtP84gYPc5Hdo3IeJtwnGI8Xe7ZFbBxsCBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ8R5hz+2HMQgOIT4Egku+daAX/QfMhbk2ccuSFhbaM=;
 b=eXhVAM099V3WYDUUoW2YG11HnW+YYcE96qlXGZZrA8a5BMf/iGMcTsYTh8/yJzFI4ZlRROBJsyBk7DXEDDbbHSwn3gqn3m0qsfVbIyVfbmAzp8yz80pvZn34ipFkxJbtReBdTVnqPntg+QtpmKt0QFFOow/0Rwm8oRB9NL8amDk1NqjO9uEh0AxiMup+MjMH1snUbOVpY82BO9fIOx3J4RbYdOwu848fyg1SWdV6MtCFK80sBnLsOcZeGEGg6u2BSxtjry7fsFD5v7nWE3S4Yw9FxUkqamFvoBsqS+yfy0E7ZCp1Pg5gKycrELr1R2Bhwb+moN35MN5pNHzINE6sfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ8R5hz+2HMQgOIT4Egku+daAX/QfMhbk2ccuSFhbaM=;
 b=p7EbI5HrerDRyRKj5bTbb7IMIs324j4rQojmzfhwUHDHHYStQTr8NUUIOGpSTqz2d06w4Uz6mpoTzK42IQKzudiNKgquAa03nnOP7MmzqqypZayy8y4b5II0n5NSTIoZyc/6BAHHxW5mj05Zpxnj++CR5d3W0R/KLZFe74e9/EI=
Received: from CH2PR15CA0022.namprd15.prod.outlook.com (2603:10b6:610:51::32)
 by SA6PR10MB8088.namprd10.prod.outlook.com (2603:10b6:806:43f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 05:31:03 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::8f) by CH2PR15CA0022.outlook.office365.com
 (2603:10b6:610:51::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Tue, 19
 May 2026 05:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 05:31:01 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 00:30:45 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 00:30:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 00:30:44 -0500
Received: from [10.24.68.129] (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64J5UeqD3370029;
	Tue, 19 May 2026 00:30:40 -0500
Message-ID: <b7fc62b7-a73a-4201-98e1-ea6a628e9dce@ti.com>
Date: Tue, 19 May 2026 11:00:39 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: endpoint: Add API for DOE initialization and
 setup in EPC core
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<kwilczynski@kernel.org>, <bhelgaas@google.com>, <corbet@lwn.net>,
	<kishon@kernel.org>, <skhan@linuxfoundation.org>, <lukas@wunner.de>,
	<cassel@kernel.org>, <alistair@alistair23.me>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20260427051725.223704-1-a-garg7@ti.com>
 <20260427051725.223704-4-a-garg7@ti.com>
 <m4z3q3pe3ro5vkl4uq4zkewpjdqccgeact2hj4tjnkonttx4vr@ndan37zzwgxc>
 <3853ba15-d096-4cf4-b52f-8a2e5f50fe53@ti.com>
 <mn7rnqdunp4mq45a7ypf26rfpzjr2gik7w4p7hpj4x3r3fzfzz@dlrsn27u5mbf>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <mn7rnqdunp4mq45a7ypf26rfpzjr2gik7w4p7hpj4x3r3fzfzz@dlrsn27u5mbf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|SA6PR10MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: aa36374d-a02e-4e12-8b84-08deb567d0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|7416014|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0d20Qou4Hncj7dLx93uIGaUxWr1m00ZJBqcpW1sCplSp7V0grAuwt9C+LW/tCnIyUreCATztL7vkQc9A7WAZFsXxSzNC7dbNfIzaKKZVNLky/7EwwvLBc0ng6QUlACgNA023HUgSKCQIHCHqPvRM02PZ8gQIFGCj13nGh4Lq6fMQfmPzCjDtk3XmRZJUS+8PGjfz5RPqxu+63HpAVXtDkYgwKkcwSB/xNGTVfT8PEE4hIg+c46yFrMm1iAmedGXENrwpU2a37SM2reDol8WjLchoHtNbqGYlx+lfo8mMYwtq4byBxzEl+NrgJKyX1daiGYgPm7pKm9NsWdswNL3XIBY4kQ7ranwjqTNWkMm9hTkzsoOljUyWlKoi4gmB8agEPdaGnbXxuvmQUsin2dMIEDx5TfSwNLgepH9mgc0NSUX96xvtHhcXsfqFzw+itBCML2SMG6l4rbInifqJO3mjVKPMQ6W1pi7OEjWF+LqzHvd1Ghrs+AUdyeqlsEcNT8pfEao3JoQHSnlaA11/BpLHqD+IOMpOj8YpghsgiShhySJ/Q1h3p8KJkap2rI3vlTShoQ3UKJDLgPU9WzHSfNpX8aUyEp+B7QBLxzqRF4P1JElijKxpUc8rG+VVkgGoMySWougnNjIpAZcJavR1FusyAgONaYmNShd8jjeyndkKgtXoAA4MhkEapecgPKybTw15wpOn3EnHVJG+LAfhssMqd8/fjR485ih24AqZcLbD+9Q=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(7416014)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I2CKBJVpBRzPyz8YqFCVIvQ8sONy/U8zZOY2Dtktj0RjbHQ6lpd532jFCpuBqzFeNs5eFxWxeKFKAIlRov+cUr+fPQjCo5eZf2KYwLTcxfjMqGWxvbr5mpvniJ7NsNC423i2eJMbjgX6lPUNxSfcVKzTjVvfxQJg8tmaB/DswCMGFO2ziv7YJMuz6tgtN/0NNPEU8g4lTxypjZa4VXUeJxQJSGubKqDKtKwQ9xBXrk9A0rfECXNOizakbzL73czGc+JgFzcQ8lBPijKvOMsauIvvMM7C5vv8mh/QWfY8kpRhq3XPquiUhd8ZIghSu+wQZHQG+vWUJifgOgIPcpHeyJ1gUPSwLafD76Pekg0bX3CwPZFYCVJdARV9NgadD3M1FanTzkoZaJ5q5ARTAwRgsw4eGldudcQBw+BnIpVwncuKYvAieny5pvA28t8GcHDY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:31:01.9623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa36374d-a02e-4e12-8b84-08deb567d0af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8088
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-garg7@ti.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:mid,ti.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88343-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Queue-Id: 08AF6577739
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 15/05/26 18:17, Manivannan Sadhasivam wrote:
> On Fri, May 15, 2026 at 10:21:52AM +0530, Aksh Garg wrote:
>>
>>
>> On 14/05/26 13:38, Manivannan Sadhasivam wrote:
>>> On Mon, Apr 27, 2026 at 10:47:24AM +0530, Aksh Garg wrote:
>>>> Add pci_epc_setup_doe() API in EPC core driver to initialize and setup
>>>> the DOE framework for an endpoint controller. The API discovers the DOE
>>>> capabilities (extended capability ID 0x2E), and registers each discovered
>>>> DOE mailbox for all the functions in the endpoint controller. This API
>>>> should be invoked by the controller driver during probe based on the
>>>> doe_capable feature.
>>>>
>>>> Add pci_epc_destroy_doe() API in EPC core driver for cleanup of DOE
>>>> resources, which should be invoked by the controller driver during
>>>> controller cleanup based on the doe_capable feature.
>>>>
>>>> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>>>> ---
>>>>
>>>> Changes from v2 to v3:
>>>> - Rebased on 7.1-rc1.
>>>>
>>>> Changes since v1:
>>>> - New patch added to v2 (not present in v1)
>>>>
>>>> v2: https://lore.kernel.org/all/20260401073022.215805-4-a-garg7@ti.com/
>>>>
>>>> This patch is introduced based on the feedback provided by Manivannan
>>>> Sadhasivam at [1].
>>>>
>>>
>>> Sweet! But I was expecting you to add atleast one EPC driver implementation to
>>> make use of these APIs.
>>>
>>> Also, why can't you call these APIs from the EPC core directly? Maybe during
>>> pci_epc_init_notify() once the register accesses become valid.
>>
>> Can we add the DOE initialization API to pci_epc_init_notify()? This
>> API seems to be called to notify the EPF drivers that the EPC device's
>> initialization has been completed, as the name and description suggests.
> 
> That's correct. But there is no harm in calling something like
> pci_epc_init_capabilities() inside its definition. Only concern would be that
> pci_epc_init_notify() is mostly called from threaded IRQ handlers. So loading
> the handler would not be recommended. But since it is threaded anyway and we
> don't have a better place to call, it would be OK.
> 
> We could've called this from pci_epc_{create/start}, but some controllers won't
> allow accessing CSRs without REFCLK. So only after pci_init_notify(), CSRs can
> be accessed.
> 
>> As 'pci_epc_doe_setup' is a part of EPC initialization, I thought the
>> EPC drivers should call this API before calling the pci_epc_init_notify().
>>
>> However, I agree with your suggestion to call the DOE setup API directly
>> from the EPC core instead of sprinkling over the EPC drivers. I would
>> recommend renaming the pci_epc_init_notify() API (and hence the
>> pci_epc_deinit_notify() as well) to something like pci_epc_init_complete(),
>> and add the DOE setup API/logic just before the
>> logic of notifying the EPF devices.
>>
> 
> No need to rename this API. Just use as is:
> 
> 	pci_epc_init_notify()
> 		-> pci_epc_init_capabilities()
> 			-> pci_epc_init_doe()
> 		-> epf->event_ops->epc_init()

Thank you for the suggestion, I will incorporate these changes in v4 series.

Regards,
Aksh Garg

> 
> - Mani
> 


