Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2EA5FBAC1
	for <lists+linux-doc@lfdr.de>; Tue, 11 Oct 2022 20:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiJKSu2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Oct 2022 14:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiJKSu1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 14:50:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3EB3BC4D;
        Tue, 11 Oct 2022 11:50:26 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BHqAff007303;
        Tue, 11 Oct 2022 18:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yx83ODU0cPJasyXRsJAI2S6FHFdoRtcJCX0/f6l0EqA=;
 b=bEfE32zWn7KrmMgIarQ496mPN8Z/WKvtqkDlzvpj47GbwdYXJXmbrACEjIg1/eJ81j3X
 egBns0xPdhIMQMZlp3oj+irg2Kc35773DXjp2dykUOnQbn6hRB2BuIVrvdQTJQJqBu6b
 /WeMfzMR46oP+WE4DdRIu3dxWETDZJiZanaNcoMg9QrNaGq7+vOiv9rrs1k2subFDwXP
 NjIbs31x0hm1h+uH1PZklYWMPmtljs2vu3fYD0nX2lsmviuXx1lSp/TAvY3K3hGoJyUm
 B/TisbedQKzXnsNcf+p1kDU/9VGtBLqcY9AIwihcaA0Y7NMdnHRyZrhLN2rNg4qVFI9x Ew== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rx5u3h7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Oct 2022 18:50:07 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29BIo5i7027318
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Oct 2022 18:50:05 GMT
Received: from [10.110.45.33] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 11 Oct
 2022 11:50:04 -0700
Message-ID: <b738a208-26a8-03fa-b54f-811dd7c649dd@quicinc.com>
Date:   Tue, 11 Oct 2022 11:50:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v5 03/13] gunyah: Common types and error codes for Gunyah
 hypercalls
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Elliot Berman <quic_eberman@quicinc.com>
CC:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Will Deacon" <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221011000840.289033-1-quic_eberman@quicinc.com>
 <20221011000840.289033-4-quic_eberman@quicinc.com>
 <Y0UZcLl20HobX4w3@kroah.com>
 <52b07662-666a-2fc7-cb18-a9d294f7ae9b@quicinc.com>
 <Y0W6gVcxTRg/m5Nb@kroah.com>
From:   Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <Y0W6gVcxTRg/m5Nb@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MakJf8Uy2Uc5r14b727p4qI5WGEgw1cT
X-Proofpoint-ORIG-GUID: MakJf8Uy2Uc5r14b727p4qI5WGEgw1cT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=865 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110109
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/11/2022 11:48 AM, Greg Kroah-Hartman wrote:
> On Tue, Oct 11, 2022 at 11:21:36AM -0700, Elliot Berman wrote:
>>
>>
>> On 10/11/2022 12:21 AM, Greg Kroah-Hartman wrote:
>>> On Mon, Oct 10, 2022 at 05:08:30PM -0700, Elliot Berman wrote:
>>>> Add architecture-independent standard error codes, types, and macros for
>>>> Gunyah hypercalls.
>>>>
>>>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>>>> ---
>>>>    MAINTAINERS                  |  1 +
>>>>    include/asm-generic/gunyah.h | 74 ++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 75 insertions(+)
>>>>    create mode 100644 include/asm-generic/gunyah.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index ef6de7599d98..4fe8cec61551 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -8886,6 +8886,7 @@ L:	linux-arm-msm@vger.kernel.org
>>>>    S:	Supported
>>>>    F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>>>>    F:	Documentation/virt/gunyah/
>>>> +F:	include/asm-generic/gunyah.h
>>>>    HABANALABS PCI DRIVER
>>>>    M:	Oded Gabbay <ogabbay@kernel.org>
>>>> diff --git a/include/asm-generic/gunyah.h b/include/asm-generic/gunyah.h
>>>> new file mode 100644
>>>> index 000000000000..64a02dd3b5ad
>>>> --- /dev/null
>>>> +++ b/include/asm-generic/gunyah.h
>>>
>>> Why not include/linux/gunyah.h?  Why asm-generic?  This is not an
>>> architecture.
>>>
>>
>> My idea here is to differentiate between code that interacts with hypercalls
>> and code that uses the abstractions provided on top of those hypercalls.
>> include/asm-generic/gunyah.h contains architecture-independent definitions
>> for hypercalls. Hypercalls are architecture-specific.
>>
>> For instance, I wanted to avoid a header file that mixes the definitions for
>> the message-queue mailbox with the hypercall definitions that the
>> message-queue mailbox driver itself uses.
>>
>> I can put it all in include/linux/gunyah.h and delineate with some clear
>> comments, but I initially felt it would be better to have separate header
>> file.
> 
> Please put it all in one place, this is just one tiny driver and should
> not abuse the asm-generic location at all, no one is only going to want
> just this one file, they are going to need the whole thing or nothing.
> 

Let's say when we do the RISC-V port for Gunyah, we may need to move it 
back to asm-generic then?

---Trilok Soni
