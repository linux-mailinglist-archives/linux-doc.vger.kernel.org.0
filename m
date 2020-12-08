Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC082D2D90
	for <lists+linux-doc@lfdr.de>; Tue,  8 Dec 2020 15:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729679AbgLHOwe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Dec 2020 09:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47159 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729471AbgLHOwd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 09:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607439066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NYSUflpZUUZ89cE7q6id1OpwYjRrpvo45jLvK9kPzUA=;
        b=h90DEJ3k9AjmbdAhEWpKqrZmKXzK64sJsNoNSrJBQ47vTFuGhJjCI01LAgyEpKTSKmCHQ9
        LBIz73H6/wKiXS3pOLUcQin3VfSWZPaGJEWRfa+bo8D5+JduiQZF6jC1SxPvyWp2NDW8pw
        IadO4rwevzmh9IEuaq+QGhP1f6FfEec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Anqmj7lqPGS67iimRX5v8w-1; Tue, 08 Dec 2020 09:51:04 -0500
X-MC-Unique: Anqmj7lqPGS67iimRX5v8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F80803646;
        Tue,  8 Dec 2020 14:51:02 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 93DC05D9DD;
        Tue,  8 Dec 2020 14:50:54 +0000 (UTC)
Message-ID: <05aaabedd4aac7d3bce81d338988108885a19d29.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Marcelo Tosatti <mtosatti@redhat.com>
Cc:     kvm@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Date:   Tue, 08 Dec 2020 16:50:53 +0200
In-Reply-To: <20201207232920.GD27492@fuller.cnet>
References: <20201203171118.372391-1-mlevitsk@redhat.com>
         <20201203171118.372391-2-mlevitsk@redhat.com>
         <20201207232920.GD27492@fuller.cnet>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2020-12-07 at 20:29 -0300, Marcelo Tosatti wrote:
> On Thu, Dec 03, 2020 at 07:11:16PM +0200, Maxim Levitsky wrote:
> > These two new ioctls allow to more precisly capture and
> > restore guest's TSC state.
> > 
> > Both ioctls are meant to be used to accurately migrate guest TSC
> > even when there is a significant downtime during the migration.
> > 
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  Documentation/virt/kvm/api.rst | 65 ++++++++++++++++++++++++++++++
> >  arch/x86/kvm/x86.c             | 73 ++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/kvm.h       | 15 +++++++
> >  3 files changed, 153 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 70254eaa5229f..ebecfe4b414ce 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -4826,6 +4826,71 @@ If a vCPU is in running state while this ioctl is invoked, the vCPU may
> >  experience inconsistent filtering behavior on MSR accesses.
> >  
> >  
> > +4.127 KVM_GET_TSC_STATE
> > +----------------------------
> > +
> > +:Capability: KVM_CAP_PRECISE_TSC
> > +:Architectures: x86
> > +:Type: vcpu ioctl
> > +:Parameters: struct kvm_tsc_state
> > +:Returns: 0 on success, < 0 on error
> > +
> > +::
> > +
> > +  #define KVM_TSC_STATE_TIMESTAMP_VALID 1
> > +  #define KVM_TSC_STATE_TSC_ADJUST_VALID 2
> > +  struct kvm_tsc_state {
> > +	__u32 flags;
> > +	__u64 nsec;
> > +	__u64 tsc;
> > +	__u64 tsc_adjust;
> > +  };
> > +
> > +flags values for ``struct kvm_tsc_state``:
> > +
> > +``KVM_TSC_STATE_TIMESTAMP_VALID``
> > +
> > +  ``nsec`` contains nanoseconds from unix epoch.
> > +    Always set by KVM_GET_TSC_STATE, might be omitted in KVM_SET_TSC_STATE
> > +
> > +``KVM_TSC_STATE_TSC_ADJUST_VALID``
> > +
> > +  ``tsc_adjust`` contains valid IA32_TSC_ADJUST value
> > +
> > +
> > +This ioctl allows the user space to read the guest's IA32_TSC,IA32_TSC_ADJUST,
> > +and the current value of host's CLOCK_REALTIME clock in nanoseconds since unix
> > +epoch.
> 
> Why is CLOCK_REALTIME necessary at all? kvmclock uses the host clock as
> a time base, but for TSC it should not be necessary.


CLOCK_REALTIME is used as an absolute time reference that should match
on both computers. I could have used CLOCK_TAI instead for example.

The reference allows to account for time passed between saving and restoring
the TSC as explained above.


> 
> > +
> > +
> > +4.128 KVM_SET_TSC_STATE
> > +----------------------------
> > +
> > +:Capability: KVM_CAP_PRECISE_TSC
> > +:Architectures: x86
> > +:Type: vcpu ioctl
> > +:Parameters: struct kvm_tsc_state
> > +:Returns: 0 on success, < 0 on error
> > +
> > +::
> > +
> > +This ioctl allows to reconstruct the guest's IA32_TSC and TSC_ADJUST value
> > +from the state obtained in the past by KVM_GET_TSC_STATE on the same vCPU.
> > +
> > +If 'KVM_TSC_STATE_TIMESTAMP_VALID' is set in flags,
> > +KVM will adjust the guest TSC value by the time that passed since the moment
> > +CLOCK_REALTIME timestamp was saved in the struct and current value of
> > +CLOCK_REALTIME, and set the guest's TSC to the new value.
> 
> This introduces the wraparound bug in Linux timekeeping, doesnt it?

It does.
Could you prepare a reproducer for this bug so I get a better idea about
what are you talking about?

I assume you need very long (like days worth) jump to trigger this bug
and for such case we can either work around it in qemu / kernel 
or fix it in the guest kernel and I strongly prefer the latter.

Thomas, what do you think about it?

Best regards,
	Maxim Levitsky

> 

> > +
> > +Otherwise KVM will set the guest TSC value to the exact value as given
> > +in the struct.
> > +
> > +if KVM_TSC_STATE_TSC_ADJUST_VALID is set, and guest supports IA32_MSR_TSC_ADJUST,
> > +then its value will be set to the given value from the struct.
> > +
> > +It is assumed that either both ioctls will be run on the same machine,
> > +or that source and destination machines have synchronized clocks.
> 
> 
> >  5. The kvm_run structure
> >  ========================
> >  
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index a3fdc16cfd6f3..9b8a2fe3a2398 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -2438,6 +2438,21 @@ static bool kvm_get_walltime_and_clockread(struct timespec64 *ts,
> >  
> >  	return gtod_is_based_on_tsc(do_realtime(ts, tsc_timestamp));
> >  }
> > +
> > +
> > +static void kvm_get_walltime(u64 *walltime_ns, u64 *host_tsc)
> > +{
> > +	struct timespec64 ts;
> > +
> > +	if (kvm_get_walltime_and_clockread(&ts, host_tsc)) {
> > +		*walltime_ns = timespec64_to_ns(&ts);
> > +		return;
> > +	}
> > +
> > +	*host_tsc = rdtsc();
> > +	*walltime_ns = ktime_get_real_ns();
> > +}
> > +
> >  #endif
> >  
> >  /*
> > @@ -3757,6 +3772,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  	case KVM_CAP_X86_USER_SPACE_MSR:
> >  	case KVM_CAP_X86_MSR_FILTER:
> >  	case KVM_CAP_ENFORCE_PV_FEATURE_CPUID:
> > +#ifdef CONFIG_X86_64
> > +	case KVM_CAP_PRECISE_TSC:
> > +#endif
> >  		r = 1;
> >  		break;
> >  	case KVM_CAP_SYNC_REGS:
> > @@ -4999,6 +5017,61 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
> >  	case KVM_GET_SUPPORTED_HV_CPUID:
> >  		r = kvm_ioctl_get_supported_hv_cpuid(vcpu, argp);
> >  		break;
> > +#ifdef CONFIG_X86_64
> > +	case KVM_GET_TSC_STATE: {
> > +		struct kvm_tsc_state __user *user_tsc_state = argp;
> > +		u64 host_tsc;
> > +
> > +		struct kvm_tsc_state tsc_state = {
> > +			.flags = KVM_TSC_STATE_TIMESTAMP_VALID
> > +		};
> > +
> > +		kvm_get_walltime(&tsc_state.nsec, &host_tsc);
> > +		tsc_state.tsc = kvm_read_l1_tsc(vcpu, host_tsc);
> > +
> > +		if (guest_cpuid_has(vcpu, X86_FEATURE_TSC_ADJUST)) {
> > +			tsc_state.tsc_adjust = vcpu->arch.ia32_tsc_adjust_msr;
> > +			tsc_state.flags |= KVM_TSC_STATE_TSC_ADJUST_VALID;
> > +		}
> > +
> > +		r = -EFAULT;
> > +		if (copy_to_user(user_tsc_state, &tsc_state, sizeof(tsc_state)))
> > +			goto out;
> > +		r = 0;
> > +		break;
> > +	}
> > +	case KVM_SET_TSC_STATE: {
> > +		struct kvm_tsc_state __user *user_tsc_state = argp;
> > +		struct kvm_tsc_state tsc_state;
> > +		u64 host_tsc, wall_nsec;
> > +
> > +		u64 new_guest_tsc, new_guest_tsc_offset;
> > +
> > +		r = -EFAULT;
> > +		if (copy_from_user(&tsc_state, user_tsc_state, sizeof(tsc_state)))
> > +			goto out;
> > +
> > +		kvm_get_walltime(&wall_nsec, &host_tsc);
> > +		new_guest_tsc = tsc_state.tsc;
> > +
> > +		if (tsc_state.flags & KVM_TSC_STATE_TIMESTAMP_VALID) {
> > +			s64 diff = wall_nsec - tsc_state.nsec;
> > +			if (diff >= 0)
> > +				new_guest_tsc += nsec_to_cycles(vcpu, diff);
> > +			else
> > +				new_guest_tsc -= nsec_to_cycles(vcpu, -diff);
> > +		}
> > +
> > +		new_guest_tsc_offset = new_guest_tsc - kvm_scale_tsc(vcpu, host_tsc);
> > +		kvm_vcpu_write_tsc_offset(vcpu, new_guest_tsc_offset);
> > +
> > +		if (tsc_state.flags & KVM_TSC_STATE_TSC_ADJUST_VALID)
> > +			if (guest_cpuid_has(vcpu, X86_FEATURE_TSC_ADJUST))
> > +				vcpu->arch.ia32_tsc_adjust_msr = tsc_state.tsc_adjust;
> > +		r = 0;
> > +		break;
> > +	}
> > +#endif
> >  	default:
> >  		r = -EINVAL;
> >  	}
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 886802b8ffba3..bf4c38fd58291 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
> >  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
> >  #define KVM_CAP_SYS_HYPERV_CPUID 191
> >  #define KVM_CAP_DIRTY_LOG_RING 192
> > +#define KVM_CAP_PRECISE_TSC 193
> >  
> >  #ifdef KVM_CAP_IRQ_ROUTING
> >  
> > @@ -1169,6 +1170,16 @@ struct kvm_clock_data {
> >  	__u32 pad[9];
> >  };
> >  
> > +
> > +#define KVM_TSC_STATE_TIMESTAMP_VALID 1
> > +#define KVM_TSC_STATE_TSC_ADJUST_VALID 2
> > +struct kvm_tsc_state {
> > +	__u32 flags;
> > +	__u64 nsec;
> > +	__u64 tsc;
> > +	__u64 tsc_adjust;
> > +};
> > +
> >  /* For KVM_CAP_SW_TLB */
> >  
> >  #define KVM_MMU_FSL_BOOKE_NOHV		0
> > @@ -1563,6 +1574,10 @@ struct kvm_pv_cmd {
> >  /* Available with KVM_CAP_DIRTY_LOG_RING */
> >  #define KVM_RESET_DIRTY_RINGS		_IO(KVMIO, 0xc7)
> >  
> > +/* Available with KVM_CAP_PRECISE_TSC*/
> > +#define KVM_SET_TSC_STATE          _IOW(KVMIO,  0xc8, struct kvm_tsc_state)
> > +#define KVM_GET_TSC_STATE          _IOR(KVMIO,  0xc9, struct kvm_tsc_state)
> > +
> >  /* Secure Encrypted Virtualization command */
> >  enum sev_cmd_id {
> >  	/* Guest initialization commands */
> > -- 
> > 2.26.2


