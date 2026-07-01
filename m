Return-Path: <linux-doc+bounces-94313-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WhmeHwHaRGp/2AoAu9opvQ
	(envelope-from <linux-doc+bounces-94313-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 11:12:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C93A36EB7FB
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 11:12:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=HaQp00z+;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=Nr8GrEXi;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94313-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94313-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CE32303D139
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1053B47F9;
	Wed,  1 Jul 2026 09:12:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523C13BED08;
	Wed,  1 Jul 2026 09:12:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782897151; cv=none; b=s4hmW+cU8zFsLnc2zeYbzTxIbrUORPijRQl0kCMEawDc9OKj62k8C1+ahDG4gVTFMlKu6JiPPoYydiZEQ5oB1yFA2hTQmRMcS8XzY+Y7YhCGR6olNklNoPAEpCK5jp8YIrzOW6iRl5MGw6/cgcgVjMuz5xz/2eGQzUkN8gkHTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782897151; c=relaxed/simple;
	bh=VxUjj+58AxN1DHcZllF59XGxoFN64vOpQQG615c8HNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cOFi8iqNAuc5KOtOHu2q73QHwCAYvmM/NkJAcvAC2ZWwAWu2yDw/v8FxzvmRvftHAJ44r/KzRx7dQB6ltV9ankIIyBUznyZue1zqK0rqksr8yc5T+9Frou7cW5vHZ7tTxO6Leuua5ob3I8jF5Daa2ycyPbXdKAjqiGZi/W1zWtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HaQp00z+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nr8GrEXi; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 1 Jul 2026 11:12:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782897147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VxUjj+58AxN1DHcZllF59XGxoFN64vOpQQG615c8HNA=;
	b=HaQp00z++5NRvJYVHWDOmBOxrWr5RhP6Nyw6ZNOpHMGRX5TfxZi/jmnCAeLa6/AEYl1siF
	ZZLi9L9G/mRQgD4BZOsbljQuufgnPe61LN/zfZhKLKHcRjFbdaAq0u4UlTBnZQ1E0Otool
	XY6QWyHoVLA8V7U9Pvby1r6KmRP7IxIai6LlOyNhPKidTORQWlP+z+iP/YnClAxMJki4m1
	Vbrhh0ZHOwsX5wDbcBBMPOxBj4Gq5DBZLKdlnVYyhif3jCtG5NvFmGYrCVg439rAyBGkJr
	vQyvbhzP4TyZ8JaP/v9XQlI35bPmSwjolXNnefQIj7aXgZmR2pPAJ0H3ISW7gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782897147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VxUjj+58AxN1DHcZllF59XGxoFN64vOpQQG615c8HNA=;
	b=Nr8GrEXiJ/sKMV0gvf+V2fSf/wvKN6Np/MBR+idrWgrto2GX7DIiG0OIJsMKlYOA5cX12Z
	Wk4IaoZI1e6AlIAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org, op-tee@lists.trustedfirmware.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: [PATCH] Documentation: Extend the real-time hardware bits with some
 firmware bits
Message-ID: <20260701091226.7SWW4TrT@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-efi@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:ardb@kernel.org,m:clrkwllms@kernel.org,m:ilias.apalodimas@linaro.org,m:jan.kiszka@siemens.com,m:jens.wiklander@linaro.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rostedt@goodmis.org,m:john.ogness@linutronix.de,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-94313-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C93A36EB7FB

I have been reviewing how OP=E2=80=91TEE is implemented and how secure=E2=
=80=91world
invocations behave. The goal was to determine whether an OP=E2=80=91TEE cal=
l can
delay the Linux side and introduce latency depending on the time spent
in the secure world.

Similar latency effects are already known for EFI runtime services, but
this was not documented. To mitigate the impact, EFI runtime invocations
can be restricted to specific CPUs so that real=E2=80=91time workloads on o=
ther
CPUs remain unaffected. This mechanism, however, is only described in
the commit that introduced it.

This change adds a firmware section that documents these behaviours
explicitly. It highlights cases where firmware can delay the kernel,
information that may be unfamiliar to some users and surprising-or
concerning-to others.

Assisted-by: Microsoft-Copilot
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

I would appreciate an ACK from the OP-TEE camp that I got my little
research right.

 Documentation/core-api/real-time/hardware.rst | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/core-api/real-time/hardware.rst b/Documentation/=
core-api/real-time/hardware.rst
index 19f9bb3786e03..fb113848c2f70 100644
--- a/Documentation/core-api/real-time/hardware.rst
+++ b/Documentation/core-api/real-time/hardware.rst
@@ -130,3 +130,95 @@ https://github.com/Linutronix/RTC-Testbench.
 The goal of this project is to validate real-time network communication. I=
t can
 be thought of as a "cyclictest" for networking and also serves as a starti=
ng
 point for application development.
+
+Firmware
+--------
+
+The firmware often plays a significant role in system operation because it=
 can
+perform tasks that the kernel cannot directly access, and in some cases it=
 can
+even preempt or intercept the kernel.
+
+A common example of firmware assisting the kernel is when it provides a ge=
neric
+interface to a resource. Instead of accessing an RTC chip through an I2C h=
ost
+controller, the kernel may query the firmware for the current time, and the
+firmware then accesses the RTC behind the scenes.
+
+Firmware can also intercept kernel execution by providing services that
+temporarily take control of the system. One example is memory scrubbing, w=
here
+the firmware periodically pauses the kernel, reads back portions of system
+memory, and then returns control. During this time, the kernel is effectiv=
ely
+interrupted.
+In contrast, some systems provide hardware=E2=80=91based memory scrubbing,=
 which
+operates independently of firmware or software. See
+Documentation/edac/scrub.rst for details.
+
+If the kernel is intercepted for longer periods then these periods can be =
made
+visible with the hardware latency detector. See
+Documentation/trace/hwlat_detector.rst.
+
+The kernel can also be intercepted in response to specific events, such as
+overheating. In this case, the firmware may throttle the CPU or shut it do=
wn
+immediately to prevent hardware damage.
+
+Unless the firmware is well documented, it should be thoroughly tested to
+uncover any unexpected behaviour.
+
+EFI
+~~~~
+
+EFI provides runtime services that act as a communication interface betwee=
n the
+firmware and the operating system. One such service is reading and writing=
 EFI
+variables, which are used, for example, to determine the boot source.
+
+Invoking a runtime service may require the architecture to disable kernel
+preemption or interrupts during the call. This means the duration of a ser=
vice
+invocation directly affects the system=E2=80=99s observable latency. There=
 is also
+nothing that prevents a service call from disabling interrupts internally =
while
+it runs.
+
+For these reasons, EFI runtime services are disabled by default on a PREEM=
PT_RT
+kernel. They can still be enabled at boot time or via a Kconfig option if
+required.
+The native EFI runtime service implementation (where both the EFI service =
and
+the kernel are either 32=E2=80=91bit or 64=E2=80=91bit executables) uses a=
 wrapper mechanism
+that invokes the service through a dedicated workqueue. This workqueue is =
named
+efi_runtime, and it can be restricted to a housekeeping CPU using the
+``/sys/devices/virtual/workqueue/efi_runtime/cpumask`` sysfs file. Assigni=
ng it
+to a housekeeping CPU ensures that potentially long service invocations do=
 not
+impact the real=E2=80=91time workload which is restricted to other CPUs.
+
+It must also be verified that the runtime services behave as expected. Some
+implementations on the x86 architecture pause all other CPUs while one CPU
+performs the service call. In such cases, the interruption affects all CPU=
s,
+and restricting the workqueue to a single CPU provides no benefit.
+
+OP-TEE (ARM)
+~~~~~~~~~~~~
+
+OP=E2=80=91TEE uses a global serialization mechanism (the "big lock"), ens=
uring that on
+each core only one OP=E2=80=91TEE thread executes secure=E2=80=91world cod=
e at a time.
+
+Execution flows from the normal world (Linux) into the secure world (OP=E2=
=80=91TEE)
+through the secure monitor at EL3. Linux and OP=E2=80=91TEE cannot disable=
 or mask each
+other=E2=80=99s interrupts because both run at EL1 in different security s=
tates.
+
+Architecturally, the secure monitor can mask or reroute normal=E2=80=91wor=
ld interrupts
+before entering the secure world. In a correct OP=E2=80=91TEE/ TF=E2=80=91=
A implementation, it
+does not do this for the duration of secure calls. Normal=E2=80=91world in=
terrupts
+remain deliverable, and a normal=E2=80=91world IRQ will preempt OP=E2=80=
=91TEE via EL3 and
+return control to Linux.
+
+Secure=E2=80=91world interrupts (FIQs) are possible if the SoC routes a de=
vice's
+interrupt as secure. Such a secure FIQ will preempt Linux immediately, trap
+into EL3, and transfer control to OP=E2=80=91TEE's secure interrupt handle=
r. Linux
+cannot mask or preempt this. Secure FIQ handlers must therefore be extreme=
ly
+short to avoid introducing noticeable latency.
+
+The transition from normal world -> secure monitor -> OP=E2=80=91TEE and b=
ack introduces
+additional latency due to world switching and context save/ restore. This
+overhead is typically a few microseconds and usually remains in the noise
+floor.
+
+If the secure monitor masks normal=E2=80=91world interrupts during OP=E2=
=80=91TEE invocations,
+or if OP=E2=80=91TEE uses long=E2=80=91running secure FIQ handlers, then O=
P=E2=80=91TEE can introduce
+measurable latency spikes.
--=20
2.53.0


