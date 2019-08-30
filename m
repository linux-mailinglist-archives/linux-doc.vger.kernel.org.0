Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE4C1A397E
	for <lists+linux-doc@lfdr.de>; Fri, 30 Aug 2019 16:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3Orl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Aug 2019 10:47:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44968 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbfH3Ork (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Aug 2019 10:47:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A80B5307D962;
        Fri, 30 Aug 2019 14:47:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A90BA5DC18;
        Fri, 30 Aug 2019 14:47:36 +0000 (UTC)
Date:   Fri, 30 Aug 2019 16:47:34 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Steven Price <steven.price@arm.com>
Cc:     Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        Catalin Marinas <catalin.marinas@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Pouloze <suzuki.poulose@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] KVM: arm64: Document PV-time interface
Message-ID: <20190830144734.kvj4dvt32qzmhw32@kamzik.brq.redhat.com>
References: <20190830084255.55113-1-steven.price@arm.com>
 <20190830084255.55113-2-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830084255.55113-2-steven.price@arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 30 Aug 2019 14:47:39 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 30, 2019 at 09:42:46AM +0100, Steven Price wrote:
> Introduce a paravirtualization interface for KVM/arm64 based on the
> "Arm Paravirtualized Time for Arm-Base Systems" specification DEN 0057A.
> 
> This only adds the details about "Stolen Time" as the details of "Live
> Physical Time" have not been fully agreed.
> 
> User space can specify a reserved area of memory for the guest and
> inform KVM to populate the memory with information on time that the host
> kernel has stolen from the guest.
> 
> A hypercall interface is provided for the guest to interrogate the
> hypervisor's support for this interface and the location of the shared
> memory structures.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  Documentation/virt/kvm/arm/pvtime.txt   | 64 +++++++++++++++++++++++++
>  Documentation/virt/kvm/devices/vcpu.txt | 14 ++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/virt/kvm/arm/pvtime.txt
> 
> diff --git a/Documentation/virt/kvm/arm/pvtime.txt b/Documentation/virt/kvm/arm/pvtime.txt
> new file mode 100644
> index 000000000000..dda3f0f855b9
> --- /dev/null
> +++ b/Documentation/virt/kvm/arm/pvtime.txt
> @@ -0,0 +1,64 @@
> +Paravirtualized time support for arm64
> +======================================
> +
> +Arm specification DEN0057/A defined a standard for paravirtualised time
> +support for AArch64 guests:
> +
> +https://developer.arm.com/docs/den0057/a
> +
> +KVM/arm64 implements the stolen time part of this specification by providing
> +some hypervisor service calls to support a paravirtualized guest obtaining a
> +view of the amount of time stolen from its execution.
> +
> +Two new SMCCC compatible hypercalls are defined:
> +
> +PV_FEATURES 0xC5000020
> +PV_TIME_ST  0xC5000022
> +
> +These are only available in the SMC64/HVC64 calling convention as
> +paravirtualized time is not available to 32 bit Arm guests. The existence of
> +the PV_FEATURES hypercall should be probed using the SMCCC 1.1 ARCH_FEATURES
> +mechanism before calling it.
> +
> +PV_FEATURES
> +    Function ID:  (uint32)  : 0xC5000020
> +    PV_func_id:   (uint32)  : Either PV_TIME_LPT or PV_TIME_ST

PV_TIME_LPT doesn't exist

> +    Return value: (int32)   : NOT_SUPPORTED (-1) or SUCCESS (0) if the relevant
> +                              PV-time feature is supported by the hypervisor.
> +
> +PV_TIME_ST
> +    Function ID:  (uint32)  : 0xC5000022
> +    Return value: (int64)   : IPA of the stolen time data structure for this
> +                              VCPU. On failure:
> +                              NOT_SUPPORTED (-1)
> +
> +The IPA returned by PV_TIME_ST should be mapped by the guest as normal memory
> +with inner and outer write back caching attributes, in the inner shareable
> +domain. A total of 16 bytes from the IPA returned are guaranteed to be
> +meaningfully filled by the hypervisor (see structure below).
> +
> +PV_TIME_ST returns the structure for the calling VCPU.
> +
> +Stolen Time
> +-----------
> +
> +The structure pointed to by the PV_TIME_ST hypercall is as follows:
> +
> +  Field       | Byte Length | Byte Offset | Description
> +  ----------- | ----------- | ----------- | --------------------------
> +  Revision    |      4      |      0      | Must be 0 for version 0.1
> +  Attributes  |      4      |      4      | Must be 0

The above fields don't appear to be exposed to userspace in anyway. How
will we handle migration from one KVM with one version of the structure
to another?

> +  Stolen time |      8      |      8      | Stolen time in unsigned
> +              |             |             | nanoseconds indicating how
> +              |             |             | much time this VCPU thread
> +              |             |             | was involuntarily not
> +              |             |             | running on a physical CPU.
> +
> +The structure will be updated by the hypervisor prior to scheduling a VCPU. It
> +will be present within a reserved region of the normal memory given to the
> +guest. The guest should not attempt to write into this memory. There is a
> +structure per VCPU of the guest.

Should we provide a recommendation as to how that reserved memory is
provided? One memslot divided into NR_VCPUS subregions? Should the
reserved region be described to the guest kernel with DT/ACPI? Or
should userspace ensure the region is not within any DT/ACPI described
regions?

> +
> +For the user space interface see Documentation/virt/kvm/devices/vcpu.txt
> +section "3. GROUP: KVM_ARM_VCPU_PVTIME_CTRL".
> +
> diff --git a/Documentation/virt/kvm/devices/vcpu.txt b/Documentation/virt/kvm/devices/vcpu.txt
> index 2b5dab16c4f2..896777f76f36 100644
> --- a/Documentation/virt/kvm/devices/vcpu.txt
> +++ b/Documentation/virt/kvm/devices/vcpu.txt
> @@ -60,3 +60,17 @@ time to use the number provided for a given timer, overwriting any previously
>  configured values on other VCPUs.  Userspace should configure the interrupt
>  numbers on at least one VCPU after creating all VCPUs and before running any
>  VCPUs.
> +
> +3. GROUP: KVM_ARM_VCPU_PVTIME_CTRL
> +Architectures: ARM64
> +
> +3.1 ATTRIBUTE: KVM_ARM_VCPU_PVTIME_SET_IPA
> +Parameters: 64-bit base address
> +Returns: -ENXIO:  Stolen time not implemented
> +         -EEXIST: Base address already set for this VCPU
> +         -EINVAL: Base address not 64 byte aligned
> +
> +Specifies the base address of the stolen time structure for this VCPU. The
> +base address must be 64 byte aligned and exist within a valid guest memory
> +region. See Documentation/virt/kvm/arm/pvtime.txt for more information
> +including the layout of the stolen time structure.
> -- 
> 2.20.1
>

Thanks,
drew 
