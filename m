Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550EA2CA2BF
	for <lists+linux-doc@lfdr.de>; Tue,  1 Dec 2020 13:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgLAMcW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Dec 2020 07:32:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49549 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727374AbgLAMcW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 07:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606825854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q06eXl8odi6lEG1doHZ/FYy+PBYpK3IjolrV1d3xVQ0=;
        b=E8hNAyNiGjVDzHsvPI509woJdf6w4VyeSKRMWcNjqWp6jGXZtn/fb/Src9ZaYHRaa41WDU
        fHgnl0OJZRDK21Yz55ggjH17ABslD8dIVIeSkb4G+0/B7qeTT7nq6OnkUexgugs2gMP6v0
        kf0W0P7VsnQ+OR6XudLABAtVYY2uUHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-4O5-xdxsNOiXXhcDfeeJwA-1; Tue, 01 Dec 2020 07:30:49 -0500
X-MC-Unique: 4O5-xdxsNOiXXhcDfeeJwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5393D192CC44;
        Tue,  1 Dec 2020 12:30:47 +0000 (UTC)
Received: from starship (unknown [10.35.206.228])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 245525D9DC;
        Tue,  1 Dec 2020 12:30:40 +0000 (UTC)
Message-ID: <9f6dd105036d712f5f94de95b4bd2fccb0b0a333.camel@redhat.com>
Subject: Re: [PATCH 0/2] RFC: Precise TSC migration
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Marcelo Tosatti <mtosatti@redhat.com>
Cc:     kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Oliver Upton <oupton@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Wanpeng Li <wanpengli@tencent.com>,
        Borislav Petkov <bp@alien8.de>,
        Jim Mattson <jmattson@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue, 01 Dec 2020 14:30:39 +0200
In-Reply-To: <20201130191643.GA18861@fuller.cnet>
References: <20201130133559.233242-1-mlevitsk@redhat.com>
         <20201130191643.GA18861@fuller.cnet>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2020-11-30 at 16:16 -0300, Marcelo Tosatti wrote:
> Hi Maxim,
> 
> On Mon, Nov 30, 2020 at 03:35:57PM +0200, Maxim Levitsky wrote:
> > Hi!
> > 
> > This is the first version of the work to make TSC migration more accurate,
> > as was defined by Paulo at:
> > https://www.spinics.net/lists/kvm/msg225525.html
> 
> Description from Oliver's patch:
> 
> "To date, VMMs have typically restored the guest's TSCs by value using
> the KVM_SET_MSRS ioctl for each vCPU. However, restoring the TSCs by
> value introduces some challenges with synchronization as the TSCs
> continue to tick throughout the restoration process. As such, KVM has
> some heuristics around TSC writes to infer whether or not the guest or
> host is attempting to synchronize the TSCs."
> 
> Not really. The synchronization logic tries to sync TSCs during
> BIOS boot (and CPU hotplug), because the TSC values are loaded
> sequentially, say:
> 
> CPU		realtime	TSC val
> vcpu0		0 usec		0
> vcpu1		100 usec	0
> vcpu2		200 usec	0
> ...
> 
> And we'd like to see all vcpus to read the same value at all times.
> 
> Other than that, comment makes sense. The problem with live migration
> is as follows:
> 
> We'd like the TSC value to be written, ideally, just before the first
> VM-entry a vCPU (because at the moment the TSC_OFFSET has been written, 
> the vcpus tsc is ticking, which will cause a visible forward jump
> in vcpus tsc time).
> 
> Before the first VM-entry is the farthest point in time before guest
> entry that one could do that.
> 
> The window (or forward jump) between KVM_SET_TSC and VM-entry was about
> 100ms last time i checked (which results in a 100ms time jump forward), 
> See QEMU's 6053a86fe7bd3d5b07b49dae6c05f2cd0d44e687.
> 
> Have we measured any improvement with this patchset?

Its not about this window. 
It is about time that passes between the point that we read the 
TSC on source system (and we do it in qemu each time the VM is paused) 
and the moment that we set the same TSC value on the target. 
That time is unbounded.

Also this patchset should decrease TSC skew that happens
between restoring it on multiple vCPUs as well, since 
KVM_SET_TSC_STATE doesn't have to happen at the same time,
as it accounts for time passed on each vCPU.


Speaking of kvmclock, somewhat offtopic since this is a different issue,
I found out that qemu reads the kvmclock value on each pause, 
and then 'restores' on unpause, using
KVM_SET_CLOCK (this modifies the global kvmclock offset)

This means (and I tested it) that if guest uses kvmclock
for time reference, it will not account for time passed in
the paused state.

> 
> Then Paolo mentions (with >), i am replying as usual.
> 
> > Ok, after looking more at the code with Maxim I can confidently say that
> > it's a total mess.  And a lot of the synchronization code is dead
> > because 1) as far as we could see no guest synchronizes the TSC using
> > MSR_IA32_TSC; 
> 
> Well, recent BIOS'es take care of synchronizing the TSC. So when Linux
> boots, it does not have to synchronize TSC in software. 

Do you have an example of such BIOS? I tested OVMF which I compiled
from git master a few weeks ago, and I also tested this with seabios 
from qemu repo, and I have never seen writes to either TSC, or TSC_ADJUST
from BIOS.

Or do you refer to the native BIOS on the host doing TSC synchronization?

> 
> However, upon migration (and initialization), the KVM_SET_TSC's do 
> not happen at exactly the same time (the MSRs for each vCPU are loaded
> in sequence). The synchronization code in kvm_set_tsc() is for those cases.

I agree with that, and this is one of the issues that KVM_SET_TSC_STATE
is going to fix, since it accounts for it.


> 
> > and 2) writing to MSR_IA32_TSC_ADJUST does not trigger the
> > synchronization code in kvm_write_tsc.
> 
> Not familiar how guests are using MSR_IA32_TSC_ADJUST (or Linux)...
> Lets see:
> 
> 
> /*
>  * Freshly booted CPUs call into this:
>  */
> void check_tsc_sync_target(void)
> {
>         struct tsc_adjust *cur = this_cpu_ptr(&tsc_adjust);
>         unsigned int cpu = smp_processor_id();
>         cycles_t cur_max_warp, gbl_max_warp;
>         int cpus = 2;
> 
>         /* Also aborts if there is no TSC. */
>         if (unsynchronized_tsc())
>                 return;
> 
>         /*
>          * Store, verify and sanitize the TSC adjust register. If
>          * successful skip the test.
>          *
>          * The test is also skipped when the TSC is marked reliable. This
>          * is true for SoCs which have no fallback clocksource. On these
>          * SoCs the TSC is frequency synchronized, but still the TSC ADJUST
>          * register might have been wreckaged by the BIOS..
>          */
>         if (tsc_store_and_check_tsc_adjust(false) || tsc_clocksource_reliable) {
>                 atomic_inc(&skip_test);
>                 return;
>         }
> 
> retry:
> 
> I'd force that synchronization path to be taken as a test-case.

Or even better as I suggested, we might tell the guest kernel
to avoid this synchronization path when KVM is detected
(regardless of invtsc flag)

> 
> 
> > I have a few thoughts about the kvm masterclock synchronization,
> > which relate to the Paulo's proposal that I implemented.
> > 
> > The idea of masterclock is that when the host TSC is synchronized
> > (or as kernel call it, stable), and the guest TSC is synchronized as well,
> > then we can base the kvmclock, on the same pair of
> > (host time in nsec, host tsc value), for all vCPUs.
> 
> We _have_ to base. See the comment which starts with
> 
> "Assuming a stable TSC across physical CPUS, and a stable TSC"
> 
> at x86.c.
> 
> > This makes the random error in calculation of this value invariant
> > across vCPUS, and allows the guest to do kvmclock calculation in userspace
> > (vDSO) since kvmclock parameters are vCPU invariant.
> 
> Actually, without synchronized host TSCs (and the masterclock scheme,
> with a single base read from a vCPU), kvmclock in kernel is buggy as
> well:
> 
> u64 pvclock_clocksource_read(struct pvclock_vcpu_time_info *src)
> {
>         unsigned version;
>         u64 ret;
>         u64 last;
>         u8 flags;
> 
>         do {
>                 version = pvclock_read_begin(src);
>                 ret = __pvclock_read_cycles(src, rdtsc_ordered());
>                 flags = src->flags;
>         } while (pvclock_read_retry(src, version));
> 
>         if (unlikely((flags & PVCLOCK_GUEST_STOPPED) != 0)) {
>                 src->flags &= ~PVCLOCK_GUEST_STOPPED;
>                 pvclock_touch_watchdogs();
>         }
> 
>         if ((valid_flags & PVCLOCK_TSC_STABLE_BIT) &&
>                 (flags & PVCLOCK_TSC_STABLE_BIT))
>                 return ret;
> 
> The code that follows this (including cmpxchg) is a workaround for that 
> bug.

I understand that. I am not arguing that we shoudn't use the masterclock!
I am just saying the facts about the condition when it works.

> 
> Workaround would require each vCPU to write to a "global clock", on
> every clock read.
> 
> > To ensure that the guest tsc is synchronized we currently track host/guest tsc
> > writes, and enable the master clock only when roughly the same guest's TSC value
> > was written across all vCPUs.
> 
> Yes, because then you can do:
> 
> vcpu0				vcpu1
> 
> A = read TSC
> 		... elapsed time ...
> 
> 				B = read TSC
> 
> 				delta = B - A
> 
> > Recently this was disabled by Paulo
> 
> What was disabled exactly?

The running of tsc synchronization code when the _guest_ writes the TSC.

Which changes two things:
   1. If the guest de-synchronizes its TSC, we won't disable master clock.
   2. If the guest writes similar TSC values on each vCPU we won't detect
      this as synchronization attempt, replace this with exactly the same
      value and finally re-enable the master clock.

I argue that this change is OK, because Linux guests don't write to TSC at all,
the virtual BIOSes seems not to write there either, and the only case in which
the Linux guest tries to change its TSC is on CPU hotplug as you mention and 
it uses TSC_ADJUST, that currently doesn't trigger TSC synchronization code in
KVM anyway, so it is broken already.

However I also argue that we should mention this in documentation just in case,
and we might also want (also just in case) to make Linux guests avoid even trying to
touch TSC_ADJUST register when running under KVM.

To rehash my own words, the KVM_CLOCK_TSC_STABLE should be defined as:
'kvmclock is vCPU invariant, as long as the guest doesn't mess with its TSC'.

Having said all that, now that I know tsc sync code, and the
reasons why it is there, I wouldn't be arguing about putting it back either.

> 
> > and I agree with this, because I think
> > that we indeed should only make the guest TSC synchronized by default
> > (including new hotplugged vCPUs) and not do any tsc synchronization beyond that.
> > (Trying to guess when the guest syncs the TSC can cause more harm that good).
> > 
> > Besides, Linux guests don't sync the TSC via IA32_TSC write,
> > but rather use IA32_TSC_ADJUST which currently doesn't participate
> > in the tsc sync heruistics.
> 
> Linux should not try to sync the TSC with IA32_TSC_ADJUST. It expects
> the BIOS to boot with synced TSCs.
> 
> So i wonder what is making it attempt TSC sync in the first place?

CPU hotplug. And the guest doesn't really write to TSC_ADJUST 
since it's measurement code doesn't detect any tsc warps. 
 
I was just thinking that in theory since, this is a VM, and it can be 
interrupted at any point, the measurement code should sometimes fall,
and cause trouble.
I didn't do much homework on this so I might be overreacting.
 
As far as I see X86_FEATURE_TSC_RELIABLE was done mostly to support
running under Hyper-V and VMWARE, and these should be prone to similar
issues, supporting my theory.

> 
> (one might also want to have Linux's synchronization via IA32_TSC_ADJUST 
> working, but it should not need to happen in the first place, as long as 
> QEMU and KVM are behaving properly).
> 
> > And as far as I know, Linux guest is the primary (only?) user of the kvmclock.
> 
> Only AFAIK.
> 
> > I *do think* however that we should redefine KVM_CLOCK_TSC_STABLE
> > in the documentation to state that it only guarantees invariance if the guest
> > doesn't mess with its own TSC.
> > 
> > Also I think we should consider enabling the X86_FEATURE_TSC_RELIABLE
> > in the guest kernel, when kvm is detected to avoid the guest even from trying
> > to sync TSC on newly hotplugged vCPUs.
> 
> See 7539b174aef405d9d57db48c58390ba360c91312.

I know about this, and I personally always use invtsc
with my VMs.
>  
> 
> Was hoping to make that (-cpu xxx,+invtsc) the default in QEMU once invariant TSC code
> becomes stable. Should be tested enough by now?

The issue is that Qemu blocks migration when invtsc is set, based on the
fact that the target machine might have different TSC frequency and no
support for TSC scaling.
There was a long debate on this long ago.

It is possible though to override this by specifying the exact frequency
you want the guest TSC to run at, by using something like
(tsc-frequency=3500000000)
I haven't checked if libvirt does this or not.

I do think that as long as the user uses modern CPUs (which have stable TSC
and support TSC scaling), there is no reason to disable invtsc, and
therefore no reason to use kvmclock.

> 
> > (The guest doesn't end up touching TSC_ADJUST usually, but it still might
> > in some cases due to scheduling of guest vCPUs)
> > 
> > (X86_FEATURE_TSC_RELIABLE short circuits tsc synchronization on CPU hotplug,
> > and TSC clocksource watchdog, and the later we might want to keep).
> 
> The latter we want to keep.
> 
> > For host TSC writes, just as Paulo proposed we can still do the tsc sync,
> > unless the new code that I implemented is in use.
> 
> So Paolo's proposal is to
> 
> "- for live migration, userspace is expected to use the new
> KVM_GET/SET_TSC_PRECISE (or whatever the name will be) to get/set a
> (nanosecond, TSC, TSC_ADJUST) tuple."
> 
> Makes sense, so that no time between KVM_SET_TSC and
> MSR_WRITE(TSC_ADJUST) elapses, which would cause the TSC to go out
> of what is desired by the user.
> 
> Since you are proposing this new ioctl, perhaps its useful to also
> reduce the 100ms jump? 

Yep. As long as target and destantion clocks are synchronized,
it should make it better.

> 
> "- for live migration, userspace is expected to use the new
> KVM_GET/SET_TSC_PRECISE (or whatever the name will be) to get/set a
> (nanosecond, TSC, TSC_ADJUST) tuple. This value will be written
> to the guest before the first VM-entry"
> 
> Sounds like a good idea (to integrate the values in a tuple).
> 
> > Few more random notes:
> > 
> > I have a weird feeling about using 'nsec since 1 January 1970'.
> > Common sense is telling me that a 64 bit value can hold about 580 years,
> > but still I see that it is more common to use timespec which is a (sec,nsec) pair.
> 
>            struct timespec {
>                time_t   tv_sec;        /* seconds */
>                long     tv_nsec;       /* nanoseconds */
>            };
> 
> > I feel that 'kvm_get_walltime' that I added is a bit of a hack.
> > Some refactoring might improve things here.
> 
> Haven't read the patchset yet...
> 
> > For example making kvm_get_walltime_and_clockread work in non tsc case as well
> > might make the code cleaner.
> > 
> > Patches to enable this feature in qemu are in process of being sent to
> > qemu-devel mailing list.
> > 
> > Best regards,
> >        Maxim Levitsky
> > 
> > Maxim Levitsky (2):
> >   KVM: x86: implement KVM_SET_TSC_PRECISE/KVM_GET_TSC_PRECISE
> >   KVM: x86: introduce KVM_X86_QUIRK_TSC_HOST_ACCESS
> > 
> >  Documentation/virt/kvm/api.rst  | 56 +++++++++++++++++++++
> >  arch/x86/include/uapi/asm/kvm.h |  1 +
> >  arch/x86/kvm/x86.c              | 88 +++++++++++++++++++++++++++++++--
> >  include/uapi/linux/kvm.h        | 14 ++++++
> >  4 files changed, 154 insertions(+), 5 deletions(-)
> > 
> > -- 
> > 2.26.2
> > 

Best regards,
	Maxim Levitsky


