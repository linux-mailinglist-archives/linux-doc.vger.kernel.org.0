Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 635F4A00A6
	for <lists+linux-doc@lfdr.de>; Wed, 28 Aug 2019 13:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfH1LXy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Aug 2019 07:23:54 -0400
Received: from foss.arm.com ([217.140.110.172]:57506 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbfH1LXy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:23:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DAD1344;
        Wed, 28 Aug 2019 04:23:53 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9EB3F246;
        Wed, 28 Aug 2019 04:23:51 -0700 (PDT)
Subject: Re: [PATCH v3 01/10] KVM: arm64: Document PV-time interface
To:     Christoffer Dall <christoffer.dall@arm.com>
Cc:     Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <20190821153656.33429-1-steven.price@arm.com>
 <20190821153656.33429-2-steven.price@arm.com>
 <20190827084407.GA6541@e113682-lin.lund.arm.com>
From:   Steven Price <steven.price@arm.com>
Message-ID: <28c3248e-1d63-dac6-d2b0-4422025c1376@arm.com>
Date:   Wed, 28 Aug 2019 12:23:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827084407.GA6541@e113682-lin.lund.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/08/2019 09:44, Christoffer Dall wrote:
> On Wed, Aug 21, 2019 at 04:36:47PM +0100, Steven Price wrote:
>> Introduce a paravirtualization interface for KVM/arm64 based on the
>> "Arm Paravirtualized Time for Arm-Base Systems" specification DEN 0057A.
>>
>> This only adds the details about "Stolen Time" as the details of "Live
>> Physical Time" have not been fully agreed.
>>
>> User space can specify a reserved area of memory for the guest and
>> inform KVM to populate the memory with information on time that the host
>> kernel has stolen from the guest.
>>
>> A hypercall interface is provided for the guest to interrogate the
>> hypervisor's support for this interface and the location of the shared
>> memory structures.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  Documentation/virt/kvm/arm/pvtime.txt | 100 ++++++++++++++++++++++++++
>>  1 file changed, 100 insertions(+)
>>  create mode 100644 Documentation/virt/kvm/arm/pvtime.txt
>>
>> diff --git a/Documentation/virt/kvm/arm/pvtime.txt b/Documentation/virt/kvm/arm/pvtime.txt
>> new file mode 100644
>> index 000000000000..1ceb118694e7
>> --- /dev/null
>> +++ b/Documentation/virt/kvm/arm/pvtime.txt
>> @@ -0,0 +1,100 @@
>> +Paravirtualized time support for arm64
>> +======================================
>> +
>> +Arm specification DEN0057/A defined a standard for paravirtualised time
>> +support for AArch64 guests:
>> +
>> +https://developer.arm.com/docs/den0057/a
>> +
>> +KVM/arm64 implements the stolen time part of this specification by providing
>> +some hypervisor service calls to support a paravirtualized guest obtaining a
>> +view of the amount of time stolen from its execution.
>> +
>> +Two new SMCCC compatible hypercalls are defined:
>> +
>> +PV_FEATURES 0xC5000020
>> +PV_TIME_ST  0xC5000022
>> +
>> +These are only available in the SMC64/HVC64 calling convention as
>> +paravirtualized time is not available to 32 bit Arm guests. The existence of
>> +the PV_FEATURES hypercall should be probed using the SMCCC 1.1 ARCH_FEATURES
>> +mechanism before calling it.
>> +
>> +PV_FEATURES
>> +    Function ID:  (uint32)  : 0xC5000020
>> +    PV_func_id:   (uint32)  : Either PV_TIME_LPT or PV_TIME_ST
>> +    Return value: (int32)   : NOT_SUPPORTED (-1) or SUCCESS (0) if the relevant
>> +                              PV-time feature is supported by the hypervisor.
>> +
>> +PV_TIME_ST
>> +    Function ID:  (uint32)  : 0xC5000022
>> +    Return value: (int64)   : IPA of the stolen time data structure for this
>> +                              (V)CPU. On failure:
>> +                              NOT_SUPPORTED (-1)
>> +
>> +The IPA returned by PV_TIME_ST should be mapped by the guest as normal memory
>> +with inner and outer write back caching attributes, in the inner shareable
>> +domain. A total of 16 bytes from the IPA returned are guaranteed to be
>> +meaningfully filled by the hypervisor (see structure below).
>> +
>> +PV_TIME_ST returns the structure for the calling VCPU.
>> +
>> +Stolen Time
>> +-----------
>> +
>> +The structure pointed to by the PV_TIME_ST hypercall is as follows:
>> +
>> +  Field       | Byte Length | Byte Offset | Description
>> +  ----------- | ----------- | ----------- | --------------------------
>> +  Revision    |      4      |      0      | Must be 0 for version 0.1
>> +  Attributes  |      4      |      4      | Must be 0
>> +  Stolen time |      8      |      8      | Stolen time in unsigned
>> +              |             |             | nanoseconds indicating how
>> +              |             |             | much time this VCPU thread
>> +              |             |             | was involuntarily not
>> +              |             |             | running on a physical CPU.
>> +
>> +The structure will be updated by the hypervisor prior to scheduling a VCPU. It
>> +will be present within a reserved region of the normal memory given to the
>> +guest. The guest should not attempt to write into this memory. There is a
>> +structure per VCPU of the guest.
>> +
>> +User space interface
>> +====================
>> +
>> +User space can request that KVM provide the paravirtualized time interface to
>> +a guest by creating a KVM_DEV_TYPE_ARM_PV_TIME device, for example:
>> +
> 
> I feel it would be more consistent to have the details of this in
> Documentation/virt/kvm/devices/arm-pv-time.txt and refer to this
> document from here.

Fair point - I'll move this lower part of the document and add a reference.

Thanks,

Steve

>> +    struct kvm_create_device pvtime_device = {
>> +            .type = KVM_DEV_TYPE_ARM_PV_TIME,
>> +            .attr = 0,
>> +            .flags = 0,
>> +    };
>> +
>> +    pvtime_fd = ioctl(vm_fd, KVM_CREATE_DEVICE, &pvtime_device);
>> +
>> +Creation of the device should be done after creating the vCPUs of the virtual
>> +machine.
>> +
>> +The IPA of the structures must be given to KVM. This is the base address
>> +of an array of stolen time structures (one for each VCPU). The base address
>> +must be page aligned. The size must be at least 64 * number of VCPUs and be a
>> +multiple of PAGE_SIZE.
>> +
>> +The memory for these structures should be added to the guest in the usual
>> +manner (e.g. using KVM_SET_USER_MEMORY_REGION).
>> +
>> +For example:
>> +
>> +    struct kvm_dev_arm_st_region region = {
>> +            .gpa = <IPA of guest base address>,
>> +            .size = <size in bytes>
>> +    };
>> +
>> +    struct kvm_device_attr st_base = {
>> +            .group = KVM_DEV_ARM_PV_TIME_PADDR,
>> +            .attr = KVM_DEV_ARM_PV_TIME_ST,
>> +            .addr = (u64)&region
>> +    };
>> +
>> +    ioctl(pvtime_fd, KVM_SET_DEVICE_ATTR, &st_base);
>> -- 
>> 2.20.1
>>
> 
> Thanks,
> 
>     Christoffer
> 

