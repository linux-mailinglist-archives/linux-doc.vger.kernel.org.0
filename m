Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218166A70A3
	for <lists+linux-doc@lfdr.de>; Wed,  1 Mar 2023 17:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjCAQPf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Mar 2023 11:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjCAQPe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Mar 2023 11:15:34 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52803D933;
        Wed,  1 Mar 2023 08:15:33 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 321AHG7T003124;
        Wed, 1 Mar 2023 16:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4bMBbjElW5kBW/1T+PZ9m23v9PFVd1bWIgZdxnnjgWQ=;
 b=a5CPTrRSK6XsGMrFclz3y7/nPzCJPLRfjzozAzbtygNvfiXa5ZJBNSkWUHaxunJJJrpR
 DP4FOn1xbL8ulx1+Esbo1n//roOrIF2lXNW7g8oqfEnjyWPjjASfIZyE5G3kd69RBHTo
 XEpoW5kKbFgFe95sjoLDl4kpzMI7iz3ALV4kbNwpRqWx2zExfGO3tfzYQO50wDkDSCaP
 pBCBq4y5L5kUqa7gpiojy2eB2nJIESdnQpJjHF6kRz3gWb6v1UwT/s4dkymjwp5naGTd
 +onMC8kA5bJDTcqqKjWmRW/ghRHVhXJD8sjbFy0AfiJTft6VKQBgBgDMCROfwaK5MtG1 8Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1csvw268-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Mar 2023 16:15:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321GFSA9025708
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 1 Mar 2023 16:15:28 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 08:15:27 -0800
Message-ID: <a82cfc2b-36ea-a703-93b7-01ab06ef1648@quicinc.com>
Date:   Wed, 1 Mar 2023 09:15:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 8/8] MAINTAINERS: Add entry for QAIC driver
Content-Language: en-US
To:     Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
CC:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <jacek.lawrynowicz@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-9-git-send-email-quic_jhugo@quicinc.com>
 <20230301130328.GB3815307@linux.intel.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230301130328.GB3815307@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NEJplDAolygWY6SvJtfdIdBQad73owmZ
X-Proofpoint-ORIG-GUID: NEJplDAolygWY6SvJtfdIdBQad73owmZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_13,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010134
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/1/2023 6:03 AM, Stanislaw Gruszka wrote:
> On Mon, Feb 06, 2023 at 08:41:45AM -0700, Jeffrey Hugo wrote:
>> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> ---
>>   MAINTAINERS | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 263d37a..0a264f1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17170,6 +17170,14 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
>>   F:	drivers/clk/qcom/
>>   F:	include/dt-bindings/clock/qcom,*
>>   
>> +QUALCOMM CLOUD AI (QAIC) DRIVER
>> +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
>> +L:	linux-arm-msm@vger.kernel.org
> 
> Is this correct mailing list ? Should not be dri-devel ?

linux-arm-msm is the Qualcomm mailing list.  Listing dri-devel in 
addition makes sense though.  Will do.

-Jeff
