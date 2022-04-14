Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD57E5006D0
	for <lists+linux-doc@lfdr.de>; Thu, 14 Apr 2022 09:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239646AbiDNHXK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 Apr 2022 03:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240218AbiDNHXH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Apr 2022 03:23:07 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2E455BE3;
        Thu, 14 Apr 2022 00:20:43 -0700 (PDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23E6ulXq029810;
        Thu, 14 Apr 2022 07:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=M7qdITGxKMZflqtUEJitwS22RS7/VW8O4gC7lkHX6aE=;
 b=G45Hr2OlusJpUCsbehcPMM8yaS8GNgqUAeRfZlJWZaH3yxySfICNo89cb57zXaWLsX0k
 W1RMssE/8McYAETLYzU77k7mYdR3AKZuUPS36lA10gileH7WR8LSv1E3ePGagplW7mfx
 zZWfpzTUyLMDJ1osPer3HhsZfa7Vf9Hp8Fq69PM1A5ovZnLtl3iwV3fooy98m9nzO325
 iCWYP9udTdpy12rjTxhu1l/XA74lD2NuXtj3PlC7Ex31DA+mSTIW9SBK3MV6r6C4Jif1
 bzw6ozB1dnKJTdViP1QbEP0rsK6hIg6PUiHYBgTGJZVrO79j8OG+sQHWUp4oYY4h3xjk 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3feesu0e38-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Apr 2022 07:20:41 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23E7FQuw032322;
        Thu, 14 Apr 2022 07:20:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3feesu0e2v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Apr 2022 07:20:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23E78375003025;
        Thu, 14 Apr 2022 07:20:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma02fra.de.ibm.com with ESMTP id 3fb1s8peq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Apr 2022 07:20:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23E782ol46858612
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Apr 2022 07:08:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 298C8A4054;
        Thu, 14 Apr 2022 07:20:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0D900A405B;
        Thu, 14 Apr 2022 07:20:35 +0000 (GMT)
Received: from [9.171.7.59] (unknown [9.171.7.59])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 14 Apr 2022 07:20:34 +0000 (GMT)
Message-ID: <95e46303-931c-ec90-94f3-67ed34383650@linux.ibm.com>
Date:   Thu, 14 Apr 2022 09:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 11/21] KVM: s390: pci: do initial setup for AEN
 interpretation
Content-Language: en-US
To:     Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org
Cc:     alex.williamson@redhat.com, cohuck@redhat.com,
        schnelle@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
        hca@linux.ibm.com, gor@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, thuth@redhat.com,
        pasic@linux.ibm.com, pbonzini@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20220404174349.58530-1-mjrosato@linux.ibm.com>
 <20220404174349.58530-12-mjrosato@linux.ibm.com>
From:   Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220404174349.58530-12-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W8aJ_56TwyEef8MQtx5uqh8024usFQ7B
X-Proofpoint-ORIG-GUID: yihznpiYOr22q6IIqJIXq14-4f90b2RP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_01,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140038
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Am 04.04.22 um 19:43 schrieb Matthew Rosato:
> Initial setup for Adapter Event Notification Interpretation for zPCI
> passthrough devices.  Specifically, allocate a structure for forwarding of
> adapter events and pass the address of this structure to firmware.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
[...]
>   
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 156d1c25a3c1..9db6f8080f71 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -47,6 +47,7 @@
>   #include <asm/fpu/api.h>
>   #include "kvm-s390.h"
>   #include "gaccess.h"
> +#include "pci.h"
>   
>   #define CREATE_TRACE_POINTS
>   #include "trace.h"
> @@ -502,6 +503,14 @@ int kvm_arch_init(void *opaque)
>   		goto out;
>   	}
>   
> +	if (kvm_s390_pci_interp_allowed()) {
> +		rc = kvm_s390_pci_init();
> +		if (rc) {
> +			pr_err("Unable to allocate AIFT for PCI\n");
> +			goto out;
> +		}
> +	}
> +
>   	rc = kvm_s390_gib_init(GAL_ISC);
>   	if (rc)
>   		goto out;

We would not free the aift that was allocated by kvm_s390_pci_init
in kvm_arch_exit.
Wouldnt we re-allocate a new aift when we unload/reload kvm forgetting about the old one?


> diff --git a/arch/s390/kvm/pci.c b/arch/s390/kvm/pci.c
[...]
> +static int zpci_setup_aipb(u8 nisc)
[...]
> +	size = get_order(PAGE_ALIGN(ZPCI_NR_DEVICES *
> +						sizeof(struct zpci_gaite)));
[...]
> +	if (zpci_set_irq_ctrl(SIC_SET_AENI_CONTROLS, 0, zpci_aipb)) {
> +		rc = -EIO;
> +		goto free_gait;
> +	}
> +
> +	return 0;
> +
> +free_gait:
> +	size = get_order(PAGE_ALIGN(ZPCI_NR_DEVICES *
> +				    sizeof(struct zpci_gaite)));

size should still be valid here?

> +	free_pages((unsigned long)aift->gait, size);
> +free_sbv:
> +	airq_iv_release(aift->sbv);
> +	zpci_aif_sbv = 0;
> +free_aipb:
> +	kfree(zpci_aipb);
> +	zpci_aipb = 0;
> +
> +	return rc;
> +}
> +

The remaining parts look sane.
