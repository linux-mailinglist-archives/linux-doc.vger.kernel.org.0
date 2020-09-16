Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA31926BEC3
	for <lists+linux-doc@lfdr.de>; Wed, 16 Sep 2020 10:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgIPIDw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Sep 2020 04:03:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62592 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726424AbgIPIDo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 04:03:44 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08G7XfFw191725;
        Wed, 16 Sep 2020 04:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=kYONQpZnfoJRN7A+f+OKz3QnmPOTSx5z/t0BhOZ1t2Y=;
 b=mKW0ajCDhgsIBeC9W6whMBawJODAYR1jH5SqpG+bikxDbGclbnUEi/LPtlkC9aZR+W9s
 6FBbPVbxV4cnlu8VF/lUtfqz3GjEeUTLIyICBG0IOsFKjBV68wux464weHRHyClqW0bZ
 CLOE4qLYWqzTLtwDSwqGi6HrkM6/A7etF6lnUKjkxn0s71PYNDhcqd0ngWKYlgJp6AgZ
 O+GVpF3M2tN56WRhyoUwnArdCYImlrgrlDwD1dWbMRkNIIU0rkz2INiA7innyHLmag4w
 z+MXvSO832xIr+kEeHk3tu/WSIuBk4EHoFlrjBHRDWcY7++wGq0/xnO4zcBlY3vlZnXl fg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33kd7tauv8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Sep 2020 04:02:16 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08G7v8p0008379;
        Wed, 16 Sep 2020 08:02:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma06fra.de.ibm.com with ESMTP id 33k5u7r77d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Sep 2020 08:02:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08G82BS728705204
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Sep 2020 08:02:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A80DBA4109;
        Wed, 16 Sep 2020 08:02:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 17809A411C;
        Wed, 16 Sep 2020 08:01:57 +0000 (GMT)
Received: from satheesh (unknown [9.85.113.207])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 16 Sep 2020 08:01:56 +0000 (GMT)
Date:   Wed, 16 Sep 2020 13:31:52 +0530
From:   Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     sathnaga@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Doc: admin-guide: Add entry for kvm_cma_resv_ratio
 kernel param
Message-ID: <20200916080152.GB561070@satheesh>
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
References: <20200916061130.723411-1-sathnaga@linux.vnet.ibm.com>
 <28eb9747-e4cc-424c-1f16-c68ed165b36a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28eb9747-e4cc-424c-1f16-c68ed165b36a@infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-16_02:2020-09-15,2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=5
 spamscore=0 mlxlogscore=999 clxscore=1011 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160054
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

Thanks for the comments, will send a V2 fixing them.

On Tue, Sep 15, 2020 at 11:18:52PM -0700, Randy Dunlap wrote:
> On 9/15/20 11:11 PM, sathnaga@linux.vnet.ibm.com wrote:
> > From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> > 
> > Add document entry for kvm_cma_resv_ratio kernel param which
> > is used to alter the KVM contiguous memory allocation percentage
> > for hash pagetable allocation used by hash mode PowerPC KVM guests.
> > 
> > Cc: linux-kernel@vger.kernel.org
> > Cc: kvm-ppc@vger.kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Jonathan Corbet <corbet@lwn.net>  
> > Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index a1068742a6df..9cb126573c71 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -599,6 +599,15 @@
> >  			altogether. For more information, see
> >  			include/linux/dma-contiguous.h
> >  
> > +        kvm_cma_resv_ratio=n
> > +                        [PPC]
> 
> You can put [PPC] on the line above.
> 
sure
> > +                        Reserves given percentage from system memory area for
> > +                        contiguous memory allocation for KVM hash pagetable
> > +                        allocation.
> > +                        Bydefault it reserves 5% of total system memory.
> 
> 			   By default
> 
> > +                        Format: <integer>
> > +                        Default: 5
> > +
> 
> and please use tabs for indentation, not all spaces.
> 
sure
> >  	cmo_free_hint=	[PPC] Format: { yes | no }
> >  			Specify whether pages are marked as being inactive
> >  			when they are freed.  This is used in CMO environments
> > 
> 
> Entries in kernel-parameters.txt should be sorted into dictionary order,
> so please put that with the other kvm parameters.
> 
sure.
> thanks.
> -- 
> ~Randy
> 

Thanks!
-Satheesh.
