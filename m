Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F198C5F57DC
	for <lists+linux-doc@lfdr.de>; Wed,  5 Oct 2022 17:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJEPzO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Oct 2022 11:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiJEPzM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Oct 2022 11:55:12 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D6024BE8;
        Wed,  5 Oct 2022 08:55:11 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295EmJGY018962;
        Wed, 5 Oct 2022 15:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=PcX+8XHm3VBlQQzDvifIRNgD0UePIdcWU1z+Fgbz4vI=;
 b=k02Z1b1oLEj5A2CyPJsViXbkQdiyXkLuYgkSaIaDtI9t9xOp3dGQ1YV13PN6Rx0gRBCV
 ZZCJYIXfHHNcuI3X2slC6qP2LfakJb78D6RiwKU1j9/Me/w2yGAYmfc8+hd8m4GFA7ni
 e8YEEG9FzOlHOXFCza+dhz0QtF57wVJ2ub9kVnkzJ0W6MWKu5oYleZ81wEKDrVlN2lUN
 9Rixskp6h9aZY/x61gI5yrhq5neXd58Ydn6voAyYBVO03py+YgT+PvBOa63sI1wrhi3y
 Gx6rvwgI4ib6/Wha0+iJaUEP94juIM4tF2YV71+ZiFhb/CPUo0nYX8rwRYRhWNqyubMa kA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1c0v28hf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Oct 2022 15:55:01 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 295Emp5g020413;
        Wed, 5 Oct 2022 15:55:01 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1c0v28fw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Oct 2022 15:55:01 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 295FpRff002956;
        Wed, 5 Oct 2022 15:54:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma03fra.de.ibm.com with ESMTP id 3jxd68v83b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Oct 2022 15:54:58 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 295FstOU50135450
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 5 Oct 2022 15:54:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4B39EA4054;
        Wed,  5 Oct 2022 15:54:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 665E8A405B;
        Wed,  5 Oct 2022 15:54:52 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown [9.171.7.243])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  5 Oct 2022 15:54:52 +0000 (GMT)
Message-ID: <6e7e5c938e8de8d0314a7009e253cb372adfbe3c.camel@linux.ibm.com>
Subject: Re: [PATCH v1 1/9] s390/uaccess: Add storage key checked cmpxchg
 access to user space
From:   Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc:     Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Sven Schnelle <svens@linux.ibm.com>
Date:   Wed, 05 Oct 2022 17:54:51 +0200
In-Reply-To: <20221005161346.3c735249@p-imbrenda>
References: <20220930210751.225873-1-scgl@linux.ibm.com>
         <20220930210751.225873-2-scgl@linux.ibm.com>
         <20221005161346.3c735249@p-imbrenda>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nhAHlB3sYFXrcsS3PrSAH4gubSSE9mA_
X-Proofpoint-GUID: NwtqdOOtV4RPlq_Cp-fqtUWvebzBmgEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_03,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210050097
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2022-10-05 at 16:13 +0200, Claudio Imbrenda wrote:
> On Fri, 30 Sep 2022 23:07:43 +0200
> Janis Schoetterl-Glausch <scgl@linux.ibm.com> wrote:
> 
> > Add cmpxchg functionality similar to that in cmpxchg.h except that the
> > target is a user space address and that the address' storage key is
> > matched with the access_key argument in order to honor key-controlled
> > protection.
> > The access is performed by changing to the secondary-spaces mode and
> > setting the PSW key for the duration of the compare and swap.
> 
> this whole patch is very complex, I think it can be simplified and made
> more maintainable (see my comments below)
> 
> in the end here we need an atomic compare and swap with key checking,
> if we are doing a syscall for it, we are clearly not looking for
> performance.

If you only consider this in the context of KVM you are correct, but
Heiko wanted me not to specialize this for KVM.

> > 
> > Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> > ---
> > 
> > 
> > Possible variations:
> >   * check the assumptions made in cmpxchg_user_key_size and error out
> >   * call functions called by copy_to_user
> >      * access_ok? is a nop
> >      * should_fail_usercopy?
> >      * instrument_copy_to_user? doesn't make sense IMO
> >   * don't be overly strict in cmpxchg_user_key
> > 
> > 
> >  arch/s390/include/asm/uaccess.h | 187 ++++++++++++++++++++++++++++++++
> >  1 file changed, 187 insertions(+)
> > 
> > diff --git a/arch/s390/include/asm/uaccess.h b/arch/s390/include/asm/uaccess.h
> > index f7038b800cc3..0ce90b7e2b75 100644
> > --- a/arch/s390/include/asm/uaccess.h
> > +++ b/arch/s390/include/asm/uaccess.h
> > @@ -19,6 +19,8 @@
> >  #include <asm/extable.h>
> >  #include <asm/facility.h>
> >  #include <asm-generic/access_ok.h>
> > +#include <asm/page.h>
> > +#include <linux/log2.h>
> >  
> >  void debug_user_asce(int exit);
> >  
> > @@ -390,4 +392,189 @@ do {									\
> >  		goto err_label;						\
> >  } while (0)
> >  
> > +static __always_inline int __cmpxchg_user_key_small(int size, u64 address,
> > +						    unsigned __int128 *old_p,
> > +						    unsigned __int128 new, u8 access_key)
> > +{
> 
> can this whole function be simplified to be a C wrapper for the 4 byte
> version of compare and swap?

I think so, but all of this is supposed to mirror
arch/s390/include/asm/cmpxchg.h, although I did depart from that
somewhat. For one, I changed the decision for retrying the loop,
but I'll have to undo that since compilation for older machines
complains about xrk.
> 
> > +	u32 shift, mask, old_word, new_word, align_mask, tmp, diff;
> > +	u64 aligned;
> > +	int ret = -EFAULT;
> > +
> > +	switch (size) {
> > +	case 2:
> > +		align_mask = 2;
> > +		aligned = (address ^ (address & align_mask));
> > +		shift = (sizeof(u32) - (address & align_mask) - size) * 8;
> > +		mask = 0xffff << shift;
> > +		old_word = ((u16)*old_p) << shift;
> > +		new_word = ((u16)new) << shift;
> > +		break;
> > +	case 1:
> > +		align_mask = 3;
> > +		aligned = (address ^ (address & align_mask));
> > +		shift = (sizeof(u32) - (address & align_mask) - size) * 8;
> > +		mask = 0xff << shift;
> > +		old_word = ((u8)*old_p) << shift;
> > +		new_word = ((u8)new) << shift;
> > +		break;
> > +	}
> > +	asm volatile(
> > +		       "spka	0(%[access_key])\n"
> > +		"	sacf	256\n"
> > +		"0:	l	%[tmp],%[aligned]\n"
> > +		"1:	nr	%[tmp],%[hole_mask]\n"
> > +		"	or	%[new_word],%[tmp]\n"
> > +		"	or	%[old_word],%[tmp]\n"
> > +		"	lr	%[tmp],%[old_word]\n"
> > +		"2:	cs	%[tmp],%[new_word],%[aligned]\n"
> > +		"3:	jnl	4f\n"
> > +		"	xrk	%[diff],%[tmp],%[old_word]\n"
> > +		"	nr	%[diff],%[hole_mask]\n"
> > +		"	xr	%[new_word],%[diff]\n"
> > +		"	xr	%[old_word],%[diff]\n"
> > +		"	xrk	%[diff],%[tmp],%[old_word]\n"
> > +		"	jz	2b\n"
> > +		"4:	ipm	%[ret]\n"
> > +		"	srl	%[ret],28\n"
> > +		"5:	sacf	768\n"
> > +		"	spka	%[default_key]\n"
> > +		EX_TABLE(0b, 5b) EX_TABLE(1b, 5b)
> > +		EX_TABLE(2b, 5b) EX_TABLE(3b, 5b)
> > +		: [old_word] "+&d" (old_word),
> > +		  [new_word] "+&d" (new_word),
> > +		  [tmp] "=&d" (tmp),
> > +		  [aligned] "+Q" (*(u32 *)aligned),
> > +		  [diff] "=&d" (diff),
> > +		  [ret] "+d" (ret)
> > +		: [access_key] "a" (access_key << 4),
> > +		  [hole_mask] "d" (~mask),
> > +		  [default_key] "J" (PAGE_DEFAULT_KEY)
> > +		: "cc"
> > +	);
> > +	*old_p = (tmp & mask) >> shift;
> > +	return ret;
> > +}
> > +
> > +/**
> > + * cmpxchg_user_key_size() - cmpxchg with user space target, honoring storage keys
> > + * @size: Size of the value being cmpxchg'ed, one of 1,2,4,8,16.
> > + * @address: User space address of value to compare to *@old_p and exchange with
> > + *           *@new. Must be aligned to @size.
> > + * @old_p: Pointer to old value. Interpreted as a @size byte integer and compared
> > + *         to the content pointed to by @address in order to determine if the
> > + *         exchange occurs. The value read from @address is written back to *@old_p.
> > + * @new: New value to place at @address, interpreted as a @size byte integer.
> > + * @access_key: Access key to use for checking storage key protection.
> > + *
> > + * Perform a cmpxchg on a user space target, honoring storage key protection.
> > + * @access_key alone determines how key checking is performed, neither
> > + * storage-protection-override nor fetch-protection-override apply.
> > + *
> > + * Return:	0: successful exchange
> > + *		1: exchange failed
> > + *		-EFAULT: @address not accessible or not naturally aligned
> > + *		-EINVAL: invalid @size
> > + */
> > +static __always_inline int cmpxchg_user_key_size(int size, void __user *address,
> > +						 unsigned __int128 *old_p,
> > +						 unsigned __int128 new, u8 access_key)
> > +{
> > +	union {
> > +		u32 word;
> > +		u64 doubleword;
> > +	} old;
> > +	int ret = -EFAULT;
> > +
> > +	/*
> > +	 * The following assumes that:
> > +	 *  * the current psw key is the default key
> > +	 *  * no storage protection overrides are in effect
> > +	 */
> > +	might_fault();
> > +	switch (size) {
> > +	case 16:
> > +		asm volatile(
> > +			       "spka	0(%[access_key])\n"
> > +			"	sacf	256\n"
> > +			"0:	cdsg	%[old],%[new],%[target]\n"
> > +			"1:	ipm	%[ret]\n"
> > +			"	srl	%[ret],28\n"
> > +			"2:	sacf	768\n"
> > +			"	spka	%[default_key]\n"
> > +			EX_TABLE(0b, 2b) EX_TABLE(1b, 2b)
> > +			: [old] "+d" (*old_p),
> > +			  [target] "+Q" (*(unsigned __int128 __user *)address),
> > +			  [ret] "+d" (ret)
> > +			: [access_key] "a" (access_key << 4),
> > +			  [new] "d" (new),
> > +			  [default_key] "J" (PAGE_DEFAULT_KEY)
> > +			: "cc"
> > +		);
> > +		return ret;
> > +	case 8:
> > +		old.doubleword = *old_p;
> > +		asm volatile(
> > +			       "spka	0(%[access_key])\n"
> > +			"	sacf	256\n"
> > +			"0:	csg	%[old],%[new],%[target]\n"
> > +			"1:	ipm	%[ret]\n"
> > +			"	srl	%[ret],28\n"
> > +			"2:	sacf	768\n"
> > +			"	spka	%[default_key]\n"
> > +			EX_TABLE(0b, 2b) EX_TABLE(1b, 2b)
> > +			: [old] "+d" (old.doubleword),
> > +			  [target] "+Q" (*(u64 __user *)address),
> > +			  [ret] "+d" (ret)
> > +			: [access_key] "a" (access_key << 4),
> > +			  [new] "d" ((u64)new),
> > +			  [default_key] "J" (PAGE_DEFAULT_KEY)
> > +			: "cc"
> > +		);
> > +		*old_p = old.doubleword;
> > +		return ret;
> > +	case 4:
> > +		old.word = *old_p;
> > +		asm volatile(
> > +			       "spka	0(%[access_key])\n"
> > +			"	sacf	256\n"
> > +			"0:	cs	%[old],%[new],%[target]\n"
> > +			"1:	ipm	%[ret]\n"
> > +			"	srl	%[ret],28\n"
> > +			"2:	sacf	768\n"
> > +			"	spka	%[default_key]\n"
> > +			EX_TABLE(0b, 2b) EX_TABLE(1b, 2b)
> > +			: [old] "+d" (old.word),
> > +			  [target] "+Q" (*(u32 __user *)address),
> > +			  [ret] "+d" (ret)
> > +			: [access_key] "a" (access_key << 4),
> > +			  [new] "d" ((u32)new),
> > +			  [default_key] "J" (PAGE_DEFAULT_KEY)
> > +			: "cc"
> 
> this is the same code 3 times with only very minimal changes.
> can you factor it out in macros?
> 
> something like this:
> 
> #define DO_COMPARE_AND_SWAP(instr, _old, _addr, _ret, _key, _new) \
> 	asm volatile(
> 			"spka	0(%[access_key])\n"
> 		"	sacf	256\n" 
> 		"0:	" instr "%[old],%[new],%[target]\n"
> 		"1:	ipm	%[ret]\n"
>  		"	srl 	%[ret],28\n"
> 		"2:	sacf	768\n"
> 		"	spka	%[default_key]\n"
> 		EX_TABLE(0b, 2b) EX_TABLE(1b, 2b)
> 		: [old] "+d"(_old),
> 		  [target] "+Q" (*(_addr)),
> 		  [ret] "+d" (_ret)
> 		: [access_key] "a" ((_key) << 4),
> 		  [new] "d" (_new),
> 		  [default_key] "J" (PAGE_DEFAULT_KEY)
> 		: "cc"
> 
> and then in the code:
> 
> DO_COMPARE_AND_SWAP("cs", old.word, (u32 __user *)address, ret, access_key, (u32)new)
> 
> this way the code is not duplicated
> 
> 
> or have you tried it already and there are issues I didn't think of?

I'd prefer that, but it's different from how cmpxchg.h does it.
But then that has simpler asm and needs to special case int128 so the
benefit isn't as great. I guess Heiko should make that call.
> 
> > +		);
> > +		*old_p = old.word;
> > +		return ret;
> > +	case 2:
> > +	case 1:
> > +		return __cmpxchg_user_key_small(size, (u64)address, old_p, new, access_key);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +#define cmpxchg_user_key(target_p, old_p, new, access_key)			\

Note that this macro isn't being used because I also deviated from the
functions in cmpxchg.h here. Since we need to return an error in case
of a fault the return type cannot be void. So we can also return EINVAL
in case of an invalid size. Then cmpxchg_user_key_size is perfectly
fine to call directly, which avoids awkwardness in KVM converting the
numeric size we got from user space into the right types.
So this macro only exists for other future possible users of key
checked cmpxchg where the types are fixed at compile time.
So with your version cmpxchg_user_key_size should just recurse for the
small sizes.

> > +({										\
> > +	__typeof__(old_p) __old_p = (old_p);					\
> > +	unsigned __int128 __old = *__old_p;					\
> > +	size_t __size = sizeof(*(target_p));					\
> > +	int __ret;								\
> > +										\
> > +	BUILD_BUG_ON(__size != sizeof(*__old_p));				\
> > +	BUILD_BUG_ON(__size != sizeof(new));					\
> > +	BUILD_BUG_ON(__size > 16 || !is_power_of_2(__size));			\
> 
> and here an if to see if you need the _small version or the regular
> one, with the _small version being a wrapper around the regular one
> 
> > +	__ret = cmpxchg_user_key_size(__size, (target_p), &__old, (new),	\
> > +				      (access_key));				\
> > +	*__old_p = __old;							\
> > +	__ret;									\
> > +})
> > +
> >  #endif /* __S390_UACCESS_H */
> 

