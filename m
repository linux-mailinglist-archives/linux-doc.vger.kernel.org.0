Return-Path: <linux-doc+bounces-3152-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8E7F991C
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 07:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C64D280E90
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 06:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5180579DB;
	Mon, 27 Nov 2023 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mrDBRmM4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A33AE1;
	Sun, 26 Nov 2023 22:12:50 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR263eq015676;
	Mon, 27 Nov 2023 06:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Nw//Q0T2ItPW3xNVWkuPhtnEwG+agGNfwZ8OqqbER20=;
 b=mrDBRmM4W5BJJ/RSJMrSSZWtX2600J7lqT6+tPcBO04E4iZJYGBnHPJ+Ghf3EJ2gMSc+
 vG5zwZit2gtQRyVmK2SRKtxo0eYfSYIyFNQpjU1AD6D3ZYfDuLJZCOtFrNHmcBi28EsE
 yUC/3+4l1xmfqEdkTpstxa9ZrOH4SuRohg/Obv8z2QdUuERkvrrLuk3kMHiIEx4zeCRw
 xhy5W4RBjkxJ1QLN8tuU/+MZJ1fAWkq8Kg5as/pmiRPh2QcZ9ZUe2ARnI5FbygdaGlxH
 zpczCysdzm1io+zxnBB7fD7vfLWQM0/qqOEjUyROIfNBLYOgKYHqsF/gQ7rJubx7VryO Ew== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk7xmbew3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 06:12:31 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AR6CUCX020583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 06:12:30 GMT
Received: from [10.253.33.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 26 Nov
 2023 22:12:27 -0800
Message-ID: <826700de-ed89-4ed9-b225-e0453ecbfd3f@quicinc.com>
Date: Mon, 27 Nov 2023 14:12:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] net: phy: introduce core support for phy-mode =
 "10g-qxgmii"
To: Andrew Lunn <andrew@lunn.ch>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <corbet@lwn.net>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20231126060732.31764-1-quic_luoj@quicinc.com>
 <20231126060732.31764-2-quic_luoj@quicinc.com>
 <f97fd2f0-3e39-4de0-8b1c-f333a0f56a7f@lunn.ch>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <f97fd2f0-3e39-4de0-8b1c-f333a0f56a7f@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LpBQzuSRG-iAGm7WdZcBygis0OlOfSLD
X-Proofpoint-GUID: LpBQzuSRG-iAGm7WdZcBygis0OlOfSLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_03,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=800 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270041



On 11/27/2023 1:20 AM, Andrew Lunn wrote:
> On Sun, Nov 26, 2023 at 02:07:27PM +0800, Luo Jie wrote:
>> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>>
>> 10G-QXGMII is a MAC-to-PHY interface defined by the USXGMII multiport
>> specification. It uses the same signaling as USXGMII, but it multiplexes
>> 4 ports over the link, resulting in a maximum speed of 2.5G per port.
>>
>> Some in-tree SoCs like the NXP LS1028A use "usxgmii" when they mean
>> either the single-port USXGMII or the quad-port 10G-QXGMII variant, and
>> they could get away just fine with that thus far. But there is a need to
>> distinguish between the 2 as far as SerDes drivers are concerned.
> 
> Can this is split into two patches?

This patch is a single logical for introducing the mode 10g-qxgmii,
looks it's better to keep it within a single patch.

> 
>>   	switch (interface) {
>>   	case PHY_INTERFACE_MODE_USXGMII:
>> -		caps |= MAC_10000FD | MAC_5000FD | MAC_2500FD;
>> +		caps |= MAC_10000FD | MAC_5000FD;
>> +		fallthrough;
> 
> This change seems to refer to the second paragraph, where as the rest
> of the code is about the first. Or does splitting this cause a bisect
> problem?
> 
> 	Andrew

Since the caps change is related to the new added interface mode
10g-qxgmii, it is reasonable to keep the changes integrated here.


