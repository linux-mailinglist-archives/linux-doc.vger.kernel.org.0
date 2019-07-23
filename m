Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A0272280
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2019 00:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbfGWWju (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Jul 2019 18:39:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31632 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731202AbfGWWju (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Jul 2019 18:39:50 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6NMassp100454
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2019 18:39:48 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2tx8se5dh7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2019 18:39:48 -0400
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bauerman@linux.ibm.com>;
        Tue, 23 Jul 2019 23:39:47 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
        by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 23 Jul 2019 23:39:41 +0100
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x6NMdemE46465390
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Jul 2019 22:39:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0D62C7805F;
        Tue, 23 Jul 2019 22:39:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3DDBF7805C;
        Tue, 23 Jul 2019 22:39:32 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.148.251])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
        Tue, 23 Jul 2019 22:39:31 +0000 (GMT)
References: <20190628021934.4260-1-bauerman@linux.ibm.com> <20190628021934.4260-2-bauerman@linux.ibm.com> <20190701144752.GC25484@linux-8ccs> <87lfxel2q6.fsf@morokweng.localdomain> <20190704125427.31146026@laptop-ibm> <874l41ocf5.fsf@morokweng.localdomain> <20190705150000.372345b0@laptop-ibm>
User-agent: mu4e 1.2.0; emacs 26.2
From:   Thiago Jung Bauermann <bauerman@linux.ibm.com>
To:     Philipp Rudo <prudo@linux.ibm.com>
Cc:     Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mimi Zohar <zohar@linux.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        "James Morris" <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "David Howells" <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "AKASHI\, Takahiro" <takahiro.akashi@linaro.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v12 01/11] MODSIGN: Export module signature definitions
In-reply-to: <20190705150000.372345b0@laptop-ibm>
Date:   Tue, 23 Jul 2019 19:39:27 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19072322-0016-0000-0000-000009D393BA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011484; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01236487; UDB=6.00651706; IPR=6.01017844;
 MB=3.00027860; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-23 22:39:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072322-0017-0000-0000-0000442346CA
Message-Id: <8736iw9y00.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-23_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230230
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hello Philipp,


Philipp Rudo <prudo@linux.ibm.com> writes:

> Hi Thiago,
>
> On Thu, 04 Jul 2019 15:57:34 -0300
> Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
>
>> Hello Philipp,
>> 
>> Philipp Rudo <prudo@linux.ibm.com> writes:
>> 
>> > Hi Thiago,
>> >
>> >
>> > On Thu, 04 Jul 2019 03:42:57 -0300
>> > Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
>> >  
>> >> Jessica Yu <jeyu@kernel.org> writes:
>> >>   
>> >> > +++ Thiago Jung Bauermann [27/06/19 23:19 -0300]:    
>> >> >>IMA will use the module_signature format for append signatures, so export
>> >> >>the relevant definitions and factor out the code which verifies that the
>> >> >>appended signature trailer is valid.
>> >> >>
>> >> >>Also, create a CONFIG_MODULE_SIG_FORMAT option so that IMA can select it
>> >> >>and be able to use mod_check_sig() without having to depend on either
>> >> >>CONFIG_MODULE_SIG or CONFIG_MODULES.
>> >> >>
>> >> >>Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> >> >>Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> >> >>Cc: Jessica Yu <jeyu@kernel.org>
>> >> >>---
>> >> >> include/linux/module.h           |  3 --
>> >> >> include/linux/module_signature.h | 44 +++++++++++++++++++++++++
>> >> >> init/Kconfig                     |  6 +++-
>> >> >> kernel/Makefile                  |  1 +
>> >> >> kernel/module.c                  |  1 +
>> >> >> kernel/module_signature.c        | 46 ++++++++++++++++++++++++++
>> >> >> kernel/module_signing.c          | 56 +++++---------------------------
>> >> >> scripts/Makefile                 |  2 +-
>> >> >> 8 files changed, 106 insertions(+), 53 deletions(-)
>> >> >>
>> >> >>diff --git a/include/linux/module.h b/include/linux/module.h
>> >> >>index 188998d3dca9..aa56f531cf1e 100644
>> >> >>--- a/include/linux/module.h
>> >> >>+++ b/include/linux/module.h
>> >> >>@@ -25,9 +25,6 @@
>> >> >> #include <linux/percpu.h>
>> >> >> #include <asm/module.h>
>> >> >>
>> >> >>-/* In stripped ARM and x86-64 modules, ~ is surprisingly rare. */
>> >> >>-#define MODULE_SIG_STRING "~Module signature appended~\n"
>> >> >>-    
>> >> >
>> >> > Hi Thiago, apologies for the delay.    
>> >> 
>> >> Hello Jessica, thanks for reviewing the patch!
>> >>   
>> >> > It looks like arch/s390/kernel/machine_kexec_file.c also relies on
>> >> > MODULE_SIG_STRING being defined, so module_signature.h will need to be
>> >> > included there too, otherwise we'll run into a compilation error.    
>> >> 
>> >> Indeed. Thanks for spotting that. The patch below fixes it. It's
>> >> identical to the previous version except for the changes in 
>> >> arch/s390/kernel/machine_kexec_file.c and their description in the
>> >> commit message. I'm also copying some s390 people in this email.  
>> >
>> > to me the s390 part looks good but for one minor nit.  
>> 
>> Thanks for the prompt review!
>> 
>> > In arch/s390/Kconfig KEXEC_VERIFY_SIG currently depends on
>> > SYSTEM_DATA_VERIFICATION. I'd prefer when you update this to the new
>> > MODULE_SIG_FORMAT. It shouldn't make any difference right now, as we don't
>> > use mod_check_sig in our code path. But it could cause problems in the future,
>> > when more code might be shared.  
>> 
>> Makes sense. Here is the updated patch with the Kconfig change.
>> 
>
> The patch looks good now.

Thanks! Can I add your Reviewed-by?

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

