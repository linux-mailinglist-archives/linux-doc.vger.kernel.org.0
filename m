Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934AF67D101
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jan 2023 17:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbjAZQK4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Jan 2023 11:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbjAZQKo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 11:10:44 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB22611C0;
        Thu, 26 Jan 2023 08:10:43 -0800 (PST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QFZpij022496;
        Thu, 26 Jan 2023 16:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cq2x6FbUOZx9kgcBjP26F5SrHdNwAFSfsEsk9sJ1R30=;
 b=EYMkPOkbiZfZTXY1HSm/lsOdU5BZDA3HfJDWzYdV+hVDijARy3SJscYruFWF94G2q0QL
 f2kA1JzGTcVrote2K/6A6BPsbmYk0G+aWpo3SJMeGVuciCZst65yKZdvr7an+49dCdvJ
 Zb68hlnhmwVbd5pxu/qfiPf490H3HUatfDSMojcC2zpt3ECophKd76RigC/tcjAeXcxE
 z0iMwJO5kPuuGtokklr6aMQc1G6jo9yNxub8CCSy0E8xd8E8GAXHh7fmP+JKLm+aTGAg
 49TTL46ZFyi3ZjnMpBN+oi9Qf6SObudE4aoq/LBnJGjLhTS0Um2s2t6DH+L7JsvvrijV 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nbt6rmnrq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 16:10:38 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30QFmMlA032067;
        Thu, 26 Jan 2023 16:10:38 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nbt6rmnqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 16:10:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30Q9weI4010329;
        Thu, 26 Jan 2023 16:10:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
        by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n87p6pjpe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 16:10:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
        by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30QGAVAf49479970
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 Jan 2023 16:10:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2E7192004D;
        Thu, 26 Jan 2023 16:10:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EA65720043;
        Thu, 26 Jan 2023 16:10:30 +0000 (GMT)
Received: from [9.152.224.253] (unknown [9.152.224.253])
        by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Thu, 26 Jan 2023 16:10:30 +0000 (GMT)
Message-ID: <aa942cf0-6f50-05f5-75a9-278129f00bf6@linux.ibm.com>
Date:   Thu, 26 Jan 2023 17:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Sven Schnelle <svens@linux.ibm.com>
References: <20230125212608.1860251-1-scgl@linux.ibm.com>
 <20230125212608.1860251-13-scgl@linux.ibm.com>
From:   Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v6 12/14] KVM: s390: Extend MEM_OP ioctl by storage key
 checked cmpxchg
In-Reply-To: <20230125212608.1860251-13-scgl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kiLQ2uwDw7JHOMfsnVnOHywLdRgnW_2W
X-Proofpoint-GUID: 41jJLM9WYa5Hpe_QpNKt_7G7rqAKm_48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_07,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260156
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/25/23 22:26, Janis Schoetterl-Glausch wrote:
> User space can use the MEM_OP ioctl to make storage key checked reads
> and writes to the guest, however, it has no way of performing atomic,
> key checked, accesses to the guest.
> Extend the MEM_OP ioctl in order to allow for this, by adding a cmpxchg
> op. For now, support this op for absolute accesses only.
> 
> This op can be use, for example, to set the device-state-change

s/use/used/

> indicator and the adapter-local-summary indicator atomically.
> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
[...]
> +/**
> + * cmpxchg_guest_abs_with_key() - Perform cmpxchg on guest absolute address.
> + * @kvm: Virtual machine instance.
> + * @gpa: Absolute guest address of the location to be changed.
> + * @len: Operand length of the cmpxchg, required: 1 <= len <= 16. Providing a
> + *       non power of two will result in failure.
> + * @old_addr: Pointer to old value. If the location at @gpa contains this value,
> + *            the exchange will succeed. After calling cmpxchg_guest_abs_with_key()
> + *            *@old_addr contains the value at @gpa before the attempt to
> + *            exchange the value.
> + * @new: The value to place at @gpa.
> + * @access_key: The access key to use for the guest access.
> + * @success: output value indicating if an exchange occurred.
> + *
> + * Atomically exchange the value at @gpa by @new, if it contains *@old.
> + * Honors storage keys.
> + *
> + * Return: * 0: successful exchange
> + *         * a program interruption code indicating the reason cmpxchg could
> + *           not be attempted

Nit:
 >0: a program interruption code...


> + *         * -EINVAL: address misaligned or len not power of two
> + *         * -EAGAIN: transient failure (len 1 or 2)
> + *         * -EOPNOTSUPP: read-only memslot (should never occur)
> + */
> +int cmpxchg_guest_abs_with_key(struct kvm *kvm, gpa_t gpa, int len,
> +			       __uint128_t *old_addr, __uint128_t new,
> +			       u8 access_key, bool *success)
> +{
> +	gfn_t gfn = gpa >> PAGE_SHIFT;

  gpa_to_gfn()?

> +	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> +	bool writable;
> +	hva_t hva;
> +	int ret;
> +
> +	if (!IS_ALIGNED(gpa, len))
> +		return -EINVAL;
> +
> +	hva = gfn_to_hva_memslot_prot(slot, gfn, &writable);
> +	if (kvm_is_error_hva(hva))
> +		return PGM_ADDRESSING;
> +	/*
> +	 * Check if it's a read-only memslot, even though that cannot occur
> +	 * since those are unsupported.
> +	 * Don't try to actually handle that case.
> +	 */
> +	if (!writable)
> +		return -EOPNOTSUPP;
> +
> +	hva += offset_in_page(gpa);

Hmm if we don't use a macro to generate these then I'd add an explanation:

cmpxchg_user_key() is a macro that is dependent on the type of "old" so 
there's no deduplication possible without further macros.

> +	switch (len) {
> +	case 1: {
> +		u8 old;
> +
> +		ret = cmpxchg_user_key((u8 *)hva, &old, *old_addr, new, access_key);
> +		*success = !ret && old == *old_addr;
> +		*old_addr = old;
> +		break;
> +	}
> +	case 2: {
> +		u16 old;
> +
> +		ret = cmpxchg_user_key((u16 *)hva, &old, *old_addr, new, access_key);
> +		*success = !ret && old == *old_addr;
> +		*old_addr = old;
> +		break;
> +	}
> +	case 4: {
> +		u32 old;
> +
> +		ret = cmpxchg_user_key((u32 *)hva, &old, *old_addr, new, access_key);
> +		*success = !ret && old == *old_addr;
> +		*old_addr = old;
> +		break;
> +	}
> +	case 8: {
> +		u64 old;
> +
> +		ret = cmpxchg_user_key((u64 *)hva, &old, *old_addr, new, access_key);
> +		*success = !ret && old == *old_addr;
> +		*old_addr = old;
> +		break;
> +	}
> +	case 16: {
> +		__uint128_t old;
> +
> +		ret = cmpxchg_user_key((__uint128_t *)hva, &old, *old_addr, new, access_key);
> +		*success = !ret && old == *old_addr;
> +		*old_addr = old;
> +		break;
> +	}
> +	default:
> +		return -EINVAL;
> +	}
> +	mark_page_dirty_in_slot(kvm, slot, gfn);

Is that needed if we failed the store?

> +	/*
> +	 * Assume that the fault is caused by protection, either key protection
> +	 * or user page write protection.
> +	 */
> +	if (ret == -EFAULT)
> +		ret = PGM_PROTECTION;
> +	return ret;
> +}
> +
>   /**
>    * guest_translate_address_with_key - translate guest logical into guest absolute address
>    * @vcpu: virtual cpu
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 4b8b41be7aed..86e9734d5782 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -584,7 +584,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_S390_VCPU_RESETS:
>   	case KVM_CAP_SET_GUEST_DEBUG:
>   	case KVM_CAP_S390_DIAG318:
> -	case KVM_CAP_S390_MEM_OP_EXTENSION:
>   		r = 1;
>   		break;
>   	case KVM_CAP_SET_GUEST_DEBUG2:
> @@ -598,6 +597,15 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_S390_MEM_OP:
>   		r = MEM_OP_MAX_SIZE;
>   		break;
> +	case KVM_CAP_S390_MEM_OP_EXTENSION:
> +		/*
> +		 * Flag bits indicating which extensions are supported.
> +		 * If r > 0, the base extension must also be supported/indicated,
> +		 * in order to maintain backwards compatibility.
> +		 */
> +		r = KVM_S390_MEMOP_EXTENSION_CAP_BASE |
> +		    KVM_S390_MEMOP_EXTENSION_CAP_CMPXCHG;
> +		break;
>   	case KVM_CAP_NR_VCPUS:
>   	case KVM_CAP_MAX_VCPUS:
>   	case KVM_CAP_MAX_VCPU_ID:
> @@ -2840,6 +2848,50 @@ static int kvm_s390_vm_mem_op_abs(struct kvm *kvm, struct kvm_s390_mem_op *mop)
>   	return r;
>   }
>   
> +static int kvm_s390_vm_mem_op_cmpxchg(struct kvm *kvm, struct kvm_s390_mem_op *mop)
> +{
> +	void __user *uaddr = (void __user *)mop->buf;
> +	void __user *old_addr = (void __user *)mop->old_addr;
> +	union {
> +		__uint128_t quad;
> +		char raw[sizeof(__uint128_t)];
> +	} old = { .quad = 0}, new = { .quad = 0 };
> +	unsigned int off_in_quad = sizeof(new) - mop->size;
> +	int r, srcu_idx;
> +	bool success;
> +
> +	r = mem_op_validate_common(mop, KVM_S390_MEMOP_F_SKEY_PROTECTION);
> +	if (r)
> +		return r;
> +	/*
> +	 * This validates off_in_quad. Checking that size is a power
> +	 * of two is not necessary, as cmpxchg_guest_abs_with_key
> +	 * takes care of that
> +	 */
> +	if (mop->size > sizeof(new))
> +		return -EINVAL;
> +	if (copy_from_user(&new.raw[off_in_quad], uaddr, mop->size))
> +		return -EFAULT;
> +	if (copy_from_user(&old.raw[off_in_quad], old_addr, mop->size))
> +		return -EFAULT;
> +
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +
> +	if (kvm_is_error_gpa(kvm, mop->gaddr)) {
> +		r = PGM_ADDRESSING;
> +		goto out_unlock;
> +	}
> +
> +	r = cmpxchg_guest_abs_with_key(kvm, mop->gaddr, mop->size, &old.quad,
> +				       new.quad, mop->key, &success);
> +	if (!success && copy_to_user(old_addr, &old.raw[off_in_quad], mop->size))
> +		r = -EFAULT;
> +
> +out_unlock:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	return r;
> +}
> +
>   static int kvm_s390_vm_mem_op(struct kvm *kvm, struct kvm_s390_mem_op *mop)
>   {
>   	/*
> @@ -2858,6 +2910,8 @@ static int kvm_s390_vm_mem_op(struct kvm *kvm, struct kvm_s390_mem_op *mop)
>   	case KVM_S390_MEMOP_ABSOLUTE_READ:
>   	case KVM_S390_MEMOP_ABSOLUTE_WRITE:
>   		return kvm_s390_vm_mem_op_abs(kvm, mop);
> +	case KVM_S390_MEMOP_ABSOLUTE_CMPXCHG:
> +		return kvm_s390_vm_mem_op_cmpxchg(kvm, mop);
>   	default:
>   		return -EINVAL;
>   	}

