Return-Path: <linux-doc+bounces-95168-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NIjJKsvmS2q7cQEAu9opvQ
	(envelope-from <linux-doc+bounces-95168-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 19:32:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A0E713E6A
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 19:32:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95168-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95168-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC9F5312699C
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 15:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB1137FF67;
	Mon,  6 Jul 2026 15:21:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421C638758C
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:21:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351278; cv=none; b=eiwV869kuhowIXm6Vb6+Ansp6rkEBpLpAf61NjcufS/QiUMQkAgiaOODyCOiNeucmlERPopBEqWIruEnUBWaDyv4HrRvGaKmGJ6stN+1XEkIvfMbmRHu7Q5JAsOeOXG8pJJ4g4L8F6GFJT2VLAqlIy7fUuSZK6lrtpXf9XjldI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351278; c=relaxed/simple;
	bh=HR55Q/6yr5mPGu9pVNCuycHEfgXOsLJKHuzG7udNXYE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=PHxUJCkWgBKgATRf11Q7qku94VbM8cJU4aADNXlh9Bxa20eWotI03E8Qc1F5L0lZJNID082NXJ6HMqhNlOZ7+Y/Yhw8kQzvuzqOTbO0/t2URb7Ai1MhA7dH+ZaCH9f+IzwRbx9BbMOhUJNhkNjuUI4i4t83X4rSzKRHzQ4+S3AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a0f261aeb6so4307083eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 08:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351276; x=1783956076;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5dwe3FtSSXb9oYBtB9Tjm7DKvidSGWsMC0MjKKokC7E=;
        b=S9Zzvjm0yqFayzRQR8Se6IHv3tmmE94retbOc0GSlqk0VV3uANltllRrBsPs2lPzEo
         AxTKwlUh9Bx8/1nvLOlLywB3YoJOCkS8CGzWM1d/ejhtxAthJa/yJYBirrwKKOWXkKqG
         mGtEsTyv3TeP5vLbHUjSSHuRV3wcj7RNpD1Ns2piwOi+WoDNUl4eml69cY6KI2b/OEBE
         5p/cybIM60i3wiEqweJIsy1AHcStT8AO6e3025BWa7/9++4T1vPY8LZKJsGus+WvcVBt
         /8nAPxBZycTPikd77ZcbQL40DornSyQk4MR9pDy6AwFDEJt8yVkql2VGim8Q+zw68ZYk
         ywCw==
X-Forwarded-Encrypted: i=1; AFNElJ935gCcs/x3BhccgYEpN1q1rU5djmm7aED1BlWKzEq2QytcjyqxsuaE037Hmy1lqNa43I40XEURNfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgjMLKYKakLJq6AYIvHTzGh2H6o+qFwX7raQF3dXL2eSha3mAk
	ET/QxkZ4qp81eEvXky/xd8dpp0QrWBlM9g6OBTaF7PB7JgXZ3HpW4cfYgjAsNUVoc9YcKkm7AcG
	NDnTQyLm+/MHLgDdy/MUp5Tgv5E8j+ab+ykMYGhsyXsSxgITtI+opWQjMkhg=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e84a:0:b0:6a1:42b7:1dfe with SMTP id
 006d021491bc7-6a35536a32bmr615101eaf.16.1783351276346; Mon, 06 Jul 2026
 08:21:16 -0700 (PDT)
Date: Mon, 06 Jul 2026 08:21:16 -0700
In-Reply-To: <20260706092021.3625908-2-twiederh@redhat.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4bc7ec.57639fcc.86d58.0001.GAE@google.com>
Subject: [syzbot ci] Re: KVM: x86: Document and enforce APIC base memory hole
From: syzbot ci <syzbot+cie24f8b96f7149963@syzkaller.appspotmail.com>
To: bp@alien8.de, corbet@lwn.net, dave.hansen@linux.intel.com, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, pbonzini@redhat.com, seanjc@google.com, 
	skhan@linuxfoundation.org, tglx@kernel.org, twiederh@redhat.com, 
	x86@kernel.org
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mingo@redhat.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:twiederh@redhat.com,m:x86@kernel.org,m:syzbot@lists.linux.dev,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95168-lists,linux-doc=lfdr.de,cie24f8b96f7149963];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,googlegroups.com:email,googlesource.com:url,syzbot.org:url,appspotmail.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3A0E713E6A

syzbot ci has tested the following series

[v1] KVM: x86: Document and enforce APIC base memory hole
https://lore.kernel.org/all/20260706092021.3625908-2-twiederh@redhat.com
* [PATCH 1/4] KVM: x86: Document that KVM_CREATE_IRQCHIP must precede vcpu creation
* [PATCH 2/4] KVM: x86: Document APIC base address constraint for in-kernel irqchip
* [PATCH 3/4] KVM: x86: Reject KVM_CREATE_IRQCHIP if APIC base is already mapped
* [PATCH 4/4] KVM: x86: Reject user memory regions covering the APIC base

and found the following issue:
WARNING: suspicious RCU usage in gfn_to_memslot

Full report is available here:
https://ci.syzbot.org/series/b02ae7eb-bae2-492f-88f2-fa1b511c93cf

***

WARNING: suspicious RCU usage in gfn_to_memslot

tree:      kvm-next
URL:       https://kernel.googlesource.com/pub/scm/virt/kvm/kvm/
base:      8cd9520d35a6c38db6567e97dd93b1f11f185dc6
arch:      amd64
compiler:  Debian clang version 22.1.6 (++20260514074242+fc4aad7b5db3-1~exp1~20260514074407.73), Debian LLD 22.1.6
config:    https://ci.syzbot.org/builds/2e25da54-5ae8-4f08-889d-30a90ffbe688/config
syz repro: https://ci.syzbot.org/findings/707c5fee-46af-42c3-9700-7fc53ef58eb2/syz_repro

=============================
WARNING: suspicious RCU usage
syzkaller #0 Not tainted
-----------------------------
./include/linux/kvm_host.h:1084 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
1 lock held by syz.0.17/5871:
 #0: ffff888113334b40 (&kvm->lock){+.+.}-{4:4}, at: kvm_arch_vm_ioctl+0x8d1/0x1990 arch/x86/kvm/x86.c:7320

stack backtrace:
CPU: 0 UID: 0 PID: 5871 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 lockdep_rcu_suspicious+0x13f/0x1d0 kernel/locking/lockdep.c:6876
 __kvm_memslots include/linux/kvm_host.h:1082 [inline]
 kvm_memslots include/linux/kvm_host.h:1089 [inline]
 gfn_to_memslot+0x3df/0x420 virt/kvm/kvm_main.c:2630
 kvm_arch_vm_ioctl+0x1590/0x1990 arch/x86/kvm/x86.c:7340
 kvm_vm_ioctl+0x8f7/0xd30 virt/kvm/kvm_main.c:5381
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd744b9ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd7459b7028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fd744e15fa0 RCX: 00007fd744b9ce59
RDX: 0000000000000000 RSI: 000000000000ae60 RDI: 0000000000000004
RBP: 00007fd744c32e6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd744e16038 R14: 00007fd744e15fa0 R15: 00007ffe5f70a5a8
 </TASK>


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

To test a patch for this bug, please reply with `#syz test`
(should be on a separate line).

The patch should be attached to the email.
Note: arguments like custom git repos and branches are not supported.

