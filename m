Return-Path: <linux-doc+bounces-19221-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B79913CD7
	for <lists+linux-doc@lfdr.de>; Sun, 23 Jun 2024 18:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 112E3283233
	for <lists+linux-doc@lfdr.de>; Sun, 23 Jun 2024 16:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F10118307A;
	Sun, 23 Jun 2024 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PevpB3q8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA1181311
	for <linux-doc@vger.kernel.org>; Sun, 23 Jun 2024 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719161193; cv=none; b=WkBcIhLN5VuA08ja5gQIwZr4xQNo3wTtEsluzAwmSRo0zOiFlFYGiI/zarz9/Ynfn1a4sHwJNXmz1dq5AMb0G/rj6gUZNx+EaZQz4+FS9kP2CdfXAKiFwFrKQKfTD6vvA2mKjupX86CR3rWP6OhCy9JGufJhDpHI8oD04/TAiMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719161193; c=relaxed/simple;
	bh=uSgvMQ21c8MCk6CFXz6CJcdDYs94c/fyivKu+fq5mEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UGir1DTDq7wqWP95lmOvWEiBYkSaNnuK1UmF0XsDJFXBMEUOynHVzouuAobUlmdJiDb4wyG/FfHdFS6ygmybQWy1WAAhU3Y5EeU29baAD4/2P15gwv3olCZTykG/pYf7XYylq7NMzCAev2By4DJhCilsoxsVPIrVLeZpdWg+tK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PevpB3q8; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-64399573fd3so21108897b3.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Jun 2024 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719161190; x=1719765990; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7ypldIW+X6JEp0kZhCbqcH0KNcqVo/fkANJ8q1vMpM=;
        b=PevpB3q8gKBN2XZ4iSiPc+8iZ/1L5Xmavfxi9m7G98VGzfAOpnNQ/o/sETKpjUqCNn
         Q+JTemf9kTGAzu5PAQrtkLMvSxVcRGmxjlKECF5VeJ+ufDe3tOmuknSybUKu2+1ZhtnC
         UdfrzEJO/xIk9bmODoy/ZBD2k6vDaL1wiHK7mylBG8vjFbbw40ScynaGg+mfeq32c0EZ
         5TieHXK46r2ENQFqIZ2oaxzPPpy7U/2DtaZZRhZ69BA19DIfUGsPgjUdXRvWA37hslhx
         +UEDf9ONEoQxjcDK89SPUq8QrzQueM1SwudKtq06AIGrE+lLqSV6G0X4G45yGeEdDxhK
         QK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719161190; x=1719765990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7ypldIW+X6JEp0kZhCbqcH0KNcqVo/fkANJ8q1vMpM=;
        b=T4byERf02mROrXEZS0qG82D/69fljz5Xnxn+s1mJ0qPM7o/TmQxkaFK5yr6iyaBV0v
         cr+XkzL9MYS9TJLwC2AKTYlYh95XztdXpGdZYeLTaItmf/rclw+ehNM/1j5Z+BPEgZzx
         PUrjLDRCF4y8bgo1yFItOGiNEhgSVzuCs1Fc7Zttg73gkQTQhXy83aXHu+cHSYFWdBvA
         Vt0+dRX4pKwTAYBiyPaHWsR5RA86gh0FRzaltooHhgUfeLM2UCTnSEElsWGZJ7Tdq0rJ
         5ai6yinwf8Y2xbYrLGnRf2dMyu+4RL24+ltR0BfC4i4YRMp+6S2x59JhJUwWRkPe9hBx
         PzZg==
X-Forwarded-Encrypted: i=1; AJvYcCU3C3aGzB0Vnd83Fy9Zl105QGN4nR+6SeHLR8DqOzoGL+ElRYN8TktHfOrDelw0+sViOzoadIwxqHn8CnwfUpXkgWB4InR+fvQJ
X-Gm-Message-State: AOJu0Ywi1NGB240Ts+myM0517UgqF132KOKtlHNgZSm/8kwwU/I7yQJg
	RXO7uUiZYChGiFMENC4UB5D4YKpIKQkrZdWXzZc338a6uQX7K/3sTiIF13r2zI1hRSI/qHItBQz
	0E1raAChHk8X6LKSxlQ==
X-Google-Smtp-Source: AGHT+IHgU4P4HT/z136C3CiXDRHqbsUCHbespyEvczdjd+Msec9BV7dNZBjdz8bchM3VtP0KtJXLay4Z2DpXbpwX
X-Received: from changyuanl-desktop.svl.corp.google.com ([2620:15c:2a3:200:c9fa:2a0a:34fc:4e66])
 (user=changyuanl job=sendgmr) by 2002:a05:690c:7001:b0:62d:cef:67dd with SMTP
 id 00721157ae682-643ab458192mr3511827b3.1.1719161190180; Sun, 23 Jun 2024
 09:46:30 -0700 (PDT)
Date: Sun, 23 Jun 2024 09:45:40 -0700
In-Reply-To: <20240623164542.2999626-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240623164542.2999626-1-changyuanl@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240623164542.2999626-2-changyuanl@google.com>
Subject: [PATCH 2/3] Documentation: Enumerate allowed value macros of `irq_type`
From: Changyuan Lyu <changyuanl@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

The expression `irq_type[n]` may confuse readers to interpret `n`
as the bit position and think of CPU = 1 << 0, SPI = 1 << 1, and
PPI = 1 << 2.

Since arch/arm64/include/uapi/asm/kvm.h already has macro definitions
for the allowed values, this commit uses these symbols to clear up
the ambiguity.

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 Documentation/virt/kvm/api.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e623f072e9aca..5f45f3e584fdb 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -891,12 +891,12 @@ like this::
 
 The irq_type field has the following values:
 
-- irq_type[0]:
+- KVM_ARM_IRQ_TYPE_CPU:
 	       out-of-kernel GIC: irq_id 0 is IRQ, irq_id 1 is FIQ
-- irq_type[1]:
+- KVM_ARM_IRQ_TYPE_SPI:
 	       in-kernel GIC: SPI, irq_id between 32 and 1019 (incl.)
                (the vcpu_index field is ignored)
-- irq_type[2]:
+- KVM_ARM_IRQ_TYPE_PPI:
 	       in-kernel GIC: PPI, irq_id between 16 and 31 (incl.)
 
 (The irq_id field thus corresponds nicely to the IRQ ID in the ARM GIC specs)
-- 
2.45.2.741.gdbec12cfda-goog


