Return-Path: <linux-doc+bounces-4902-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2208106F8
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 01:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D62D21F2140B
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 00:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46D0A5E;
	Wed, 13 Dec 2023 00:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sG7bZwXG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0F299
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 16:50:50 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dbc8b07ceddso2674371276.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 16:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702428649; x=1703033449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsP6D8T5vC4K0WLWKELqerL/h2k2GCGETaeygCJbK5E=;
        b=sG7bZwXGvGujWU/Kv07//ZUVZexawR/0ceUWve54iYCKQGNMF8FAbNrrX0aufq9CAv
         am/BawKeDgKccgvSp/NTP+KRMZ6BZK7v9OYycEgi6hv2ybuLe2iPCCkx3PShmxDN4RmV
         EaupRUteZGx1Ox/AVwFLXtxIymHvBmJxib2CMOEP72c5OIeu7h7Q201dXqvwIC3R2HeJ
         VWCFhWgA2Bxfml2Z357GzFJTFQWvXXqaXbxttX89vCDkMKD0fnYBb7Mn2+VTROtmHJXt
         LUlRdVtkzOSWYNKbYKWbNhHZgufupPR3VYg4GMzTY/ymsFtUEYN562QyUvQnH71juucq
         RVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702428649; x=1703033449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsP6D8T5vC4K0WLWKELqerL/h2k2GCGETaeygCJbK5E=;
        b=TPNAPTaqD6DjJACMbSn53Jl4hY3jC0hy/tCVkdrTC/n046UfTriepmxAOpDuTTB6z8
         /OY7ZYZjOjayhenNRdVA1tn+/EhnD0THHnZdLgH2vF3mJAS4yG9T1IrCsHzrI0zIgPUc
         H4elyXF2VKR+rTlI7h7uQBCS8CkWdCBA2juMKnrV1IZfLV4N3JyCXtT17Mhr/Tq9WC/F
         LIr0Qm0D5/30bb6Ta8A80EdMABve4E7XbH0kui9ofydGm5vEg3xaTkgYmD6OC1bB8GhV
         Ct8k9o+TZMBuE56DzHmszWRV8uf+p+ofoRecxv4XbAtxCRtmDCMLwyibzSyP0uLnhEQS
         JNLQ==
X-Gm-Message-State: AOJu0YxSlu+ofbwrBRv7ydZFt6QzdUBPzWHb7+tGneuYJ2qcOowIT1O6
	9Q/QPRYG9vtZK3jRJTt0Bbb9mXqx0GfHa02W8pGbrA==
X-Google-Smtp-Source: AGHT+IFg4hZCse8kzky6Y9/DVuxOtpUz/g7bXwrKJ9hF5mEV7x9P3i3TYFdKJnIuamiDiHUwxXUn6NjiQwKNsCzwWqw=
X-Received: by 2002:a25:8051:0:b0:db7:e91c:eb1d with SMTP id
 a17-20020a258051000000b00db7e91ceb1dmr4411297ybn.102.1702428649654; Tue, 12
 Dec 2023 16:50:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-2-201c483bd775@kernel.org> <CAKC1njSC5cC_fXnyNAPt=WU6cD-OjLKFxo90oVPmsLJbuWf4nw@mail.gmail.com>
 <d708b493-267a-4418-be91-9bde6b2cf50c@sirena.org.uk>
In-Reply-To: <d708b493-267a-4418-be91-9bde6b2cf50c@sirena.org.uk>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 12 Dec 2023 16:50:38 -0800
Message-ID: <CAKC1njSQPO8ja7AkTzQ724hhSsGjchH9dLbbH9LXP0ZiKj-zPQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/39] prctl: arch-agnostic prctl for shadow stack
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 11:23=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Dec 12, 2023 at 11:17:11AM -0800, Deepak Gupta wrote:
> > On Wed, Nov 22, 2023 at 1:43=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > +/*
> > > + * Set the current shadow stack configuration.  Enabling the shadow
> > > + * stack will cause a shadow stack to be allocated for the thread.
> > > + */
> > > +#define PR_SET_SHADOW_STACK_STATUS      72
> > > +# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
>
> > Other architecture may require disabling shadow stack if glibc
> > tunables is set to permissive mode.
> > In permissive mode, if glibc encounters `dlopen` on an object which
> > doesn't support shadow stack,
> > glibc should be able to issue PR_SHADOW_STACK_DISABLE.
>
> > Architectures can choose to implement or not but I think arch agnostic
> > code should enumerate this.
>
> The current implementation for arm64 and therefore API for the prctl()
> is that whatever combination of flags is specified will be set, this
> means that setting the status to something that does not include _ENABLE
> will result in disabling and we don't need a separate flag for disable.
> We have use cases that make active use of disabling at runtime.

A theoretical scenario (no current workloads should've this case
because no shadow stack)

- User mode did _ENABLE on the main thread. Shadow stack was allocated
for the current
  thread.
- User mode created a bunch worker threads to run untrusted contained
code. They shadow
  stack too.
- main thread had to do dlopen and now need to disable shadow stack on
itself due to
  incompatibility of incoming object in address space.
- main thread controls worker threads and knows they're contained and
should still be running
  with a shadow stack. Although once in a while the main thread needs
to perform writes to a shadow
  stack of worker threads for some fixup (in the same addr space).
main thread doesn't want to delegate
  this responsibility of ss writes to worker threads because they're untrus=
ted.

How will it do that (currently _ENABLE is married to _WRITE and _PUSH) ?

Please note that I am making up this scenario just for sake of discussion
And don't know if software would be using it in this manner.

>
> Please delete unneeded context from replies, it makes it much easier to
> find new content.

Sorry about that.
Noted.

