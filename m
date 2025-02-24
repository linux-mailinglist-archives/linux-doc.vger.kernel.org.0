Return-Path: <linux-doc+bounces-39218-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8AA42797
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 17:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E25A47A8838
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 16:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845B02561B5;
	Mon, 24 Feb 2025 16:15:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53A21A0BD6
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740413735; cv=none; b=g68XSVGXmCbBilGrPFb81i6LyPyn6yJ8Pd0vQVHOAM0UulsFmKfeLxdIO9Jve5S1mFbTj+UyA/D/gjYh6FufKjIUen5pnaF4VOkO+GRxrqEYD942s3gAYza/kzEn/sij1mChnSP5u6slwdkYSOHXm9Qs54bAyhtwCeUZvH8ld6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740413735; c=relaxed/simple;
	bh=ydXaMC6zS9e4LSddJroFvhRyHHAr7tsNfPBCVg94X7Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RMIVCFOeUQN1xl+9J34iWwBC/pdDr1CL0zTsqj1WBoPuniNlA9aTxdth2qHXgE0n4WC2PvDaY3OiiGpz1bgexKJCBK4LLG210Yr7C4PAmDBBrTt/GJaBsjOEjymhZPHxnUA1YFyEIB68veJo9WFtsSQR8niLZQ/TOwWb5Gk+A/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d1a365d10fso35858205ab.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413733; x=1741018533;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q94TLh93rwphFT6Rw5s+2aRbj+FkZ2+KBTTzXF1Vz/A=;
        b=Hr36RMt8jXoLM8jhwGmho8DsWjafwbN5ohlWj6W14BGU78j47sejk5NDZ+MTGVKJP4
         QoRz1xBddfXp4Ge3fN7qBeoNypLFE0JYnZWuLb07EjJhPBWs8gkcq852UeyjoPEQFrl8
         J5cVhZhbi4buZG/oTKDmoR+sltgGOlqrjPAkzPTATzuFr3tiKXHnnFzJyQ4nJ2hm41t0
         LeavLv4wRtGjveNfHywui3cG+BMWXM97vMzvQfPshKMmUm8rus8Cp0cKQA66ZLhOYust
         kP5/Mjr04QjlVPOhdQJ/sWdqRd5Q68ZNrrjSibaltGx4tvDoCuNhl2ZmdCKs0W9ZQOb9
         QV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/SzXvQPQslLgROLQuSqusQri1Ucs5KGLVgKstEdCnBp9Nm3dgTx+GIfeJNQH2lnNwl8QlKkMrmNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQnYpCizbe4DI2uGRXWAu6LIFXZP+K7jROXm2ZpjBlTi+XkZ/
	E9U7Mt5ifh8EWHtshdXY/QvTJFpeMmPO3YzD0GePReBkIfxkE2r+A+FXW8Bk6w6k4a95/u8Ggf3
	sn9pdxDuU2wbgR1TO5SNxG29uUCB85ipdcN8XtMkD+uJIERxlbYs71i0=
X-Google-Smtp-Source: AGHT+IFvHqikWUSpJ7okF8fU05+4z27G+fhPH+6u1seiHFbMdxzpSz/ddpywMj8xOz1tS7XdMwMEd9IZ2tbLz/ffeaZrZl0Fk+LV
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9e:b0:3a9:cde3:2ecc with SMTP id
 e9e14a558f8ab-3d2c020d145mr200185565ab.6.1740413732695; Mon, 24 Feb 2025
 08:15:32 -0800 (PST)
Date: Mon, 24 Feb 2025 08:15:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67bc9b24.050a0220.bbfd1.008e.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in __fput
From: syzbot <syzbot+5014f30b0de0d4b77ae3@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, benjamin.tissoires@redhat.com, 
	bristot@redhat.com, bsegall@google.com, corbet@lwn.net, 
	david.rheinsberg@gmail.com, dietmar.eggemann@arm.com, frederic@kernel.org, 
	jiangshanlai@gmail.com, jikos@kernel.org, juri.lelli@redhat.com, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	peterz@infradead.org, rostedt@goodmis.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, tj@kernel.org, vincent.guittot@linaro.org, 
	vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d082ecbc71e9 Linux 6.14-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=164ae7a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8de9cc84d5960254
dashboard link: https://syzkaller.appspot.com/bug?extid=5014f30b0de0d4b77ae3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114ae7a4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2538edcc866d/disk-d082ecbc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fe2b2d244cf7/vmlinux-d082ecbc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/471967bae80b/bzImage-d082ecbc.xz

The issue was bisected to:

commit 616db8779b1e3f93075df691432cccc5ef3c3ba0
Author: Tejun Heo <tj@kernel.org>
Date:   Thu May 18 03:02:08 2023 +0000

    workqueue: Automatically mark CPU-hogging work items CPU_INTENSIVE

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1217e7a4580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1117e7a4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1617e7a4580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5014f30b0de0d4b77ae3@syzkaller.appspotmail.com
Fixes: 616db8779b1e ("workqueue: Automatically mark CPU-hogging work items CPU_INTENSIVE")

INFO: task syz.0.22:6033 blocked for more than 152 seconds.
      Not tainted 6.14.0-rc4-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.22        state:D stack:25656 pid:6033  tgid:6033  ppid:5937   task_flags:0x400040 flags:0x00000004
 <TASK>
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_timeout+0xb0/0x290 kernel/time/sleep_timeout.c:75
 __cancel_work_sync+0xbc/0x110 kernel/workqueue.c:4362
 uhid_dev_destroy drivers/hid/uhid.c:584 [inline]
 uhid_char_release+0xac/0x600 drivers/hid/uhid.c:662
 __fput+0x3e9/0x9f0 fs/file_table.c:464
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x13f/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0f6998d169
RSP: 002b:00007ffe4cd3e698 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000019525 RCX: 00007f0f6998d169
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f0f69ba7ba0 R08: 0000000000000001 R09: 000000024cd3e98f
R10: 00007f0f69800000 R11: 0000000000000246 R12: 00007f0f69ba5fac
R13: 00007f0f69ba5fa0 R14: ffffffffffffffff R15: 00007ffe4cd3e7b0
 </TASK>
INFO: task syz.2.18:6035 blocked for more than 156 seconds.
      Not tainted 6.14.0-rc4-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.18        state:D stack:25984 pid:6035  tgid:6035  ppid:5945   task_flags:0x400040 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_timeout+0xb0/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common kernel/sched/completion.c:116 [inline]
 wait_for_common kernel/sched/completion.c:127 [inline]
 wait_for_completion+0x355/0x620 kernel/sched/completion.c:148
 __flush_work+0xa47/0xc60 kernel/workqueue.c:4242
 __fput+0x3e9/0x9f0 fs/file_table.c:464
 task_work_run+0x24f/0x310 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x13f/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
RIP: 0033:0x7f4cedb8d169
RAX: 0000000000000000 RBX: 0000000000019540 RCX: 00007f4cedb8d169
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f4cedda7ba0 R08: 0000000000000001 R09: 0000000243e0cb6f
R10: 00007f4ceda00000 R11: 0000000000000246 R12: 00007f4cedda5fac
      Not tainted 6.14.0-rc4-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.17        state:D
 stack:25984 pid:6037  tgid:6037  ppid:5940   task_flags:0x400040 flags:0x00000004
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

