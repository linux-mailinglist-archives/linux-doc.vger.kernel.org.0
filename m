Return-Path: <linux-doc+bounces-4316-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186C8807AB5
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 22:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADA1FB21031
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 21:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BA612E65;
	Wed,  6 Dec 2023 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fpedcGrX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CBBD5C
	for <linux-doc@vger.kernel.org>; Wed,  6 Dec 2023 13:44:07 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ce6caedce6so279814b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Dec 2023 13:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701899046; x=1702503846; darn=vger.kernel.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=emWQ//128IChCAhCT/THcHGJcWxhncZjLzE78FXSX8E=;
        b=fpedcGrXN/s/usHdY5n66hpDB178ztE+Biv+HqogR8yk7FHQhvfPAypMzjmwoH3Jeu
         RQj3AtHr6cSmIK5seDqhgno1Nld+U3e1AuQ0Nss7B9j2MgyI3YQhFgesSPTXNhGZtjA/
         Fg2KaITdLEeyAmGyRZJJ4xgRH3FYX57BljlYj58IT475aJWbNLEe2vR5cZ+TnZ8iT5H3
         ji60uCNHum81RoK9CCRUrShJmxjzqXnrA1SstKerWXkQF7lURFNXqwi8UFuNhmSo7lQG
         5bnygjrk58+gvOacllLHSWymXMsoAZMtVUFlgRsJbUF0OVcjXiC/FElWsk2ARgJdtuCN
         CJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701899046; x=1702503846;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emWQ//128IChCAhCT/THcHGJcWxhncZjLzE78FXSX8E=;
        b=K9XPnFfiSxxlnRbsulxAofMbt6B90CNVXQge2m3TchCbojGh59exzKaJMGElgkAcCc
         WpXOh/bQm+uRrQtkjTwV2a0Gk8yJOISYg3N5OEFcIUZdI6bjwN4Sp2OuJKXKW5ovPrH0
         ORQFsvj19B2qAMx5JDJNRjmvVJkHqZ4McZBufAodJAqe95dQE3Q2mClaigkdvbH4x3MW
         iorpa4rJl70/82cywQjB3ViUnCx5XmgCcnSfVwNh8rEUBzfMQb8/MbfI/TggL3PvE4xd
         X6TMQKgoJoHGH4517AUKHQ9qAbmVdAm4oZ40TvjsB+XGLq3ls6WA1X7pr+urCiXi5rgN
         R0cQ==
X-Gm-Message-State: AOJu0YyDEA4aDXl9eb6nrDZmxKs69jZfL02zRGJWhGNPXy/Syn2I2q8K
	AzJEBKbDnNGgtYzByQGMa8OHoQ==
X-Google-Smtp-Source: AGHT+IF/KxemxaFFxK+8duX7yz47wLjIg4ovMlgkotFmeA6CuhxmgEGVP9MOvenfubO04eLnbo0Zng==
X-Received: by 2002:a05:6a21:190:b0:187:f343:ab3d with SMTP id le16-20020a056a21019000b00187f343ab3dmr1422332pzb.55.1701899046588;
        Wed, 06 Dec 2023 13:44:06 -0800 (PST)
Received: from localhost ([2804:14d:7e22:803e:f0e2:3ff1:8acc:a2d5])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001c74df14e6fsm267818plb.284.2023.12.06.13.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 13:44:06 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-23-201c483bd775@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 23/39] arm64/mm: Implement map_shadow_stack()
In-reply-to: <20231122-arm64-gcs-v7-23-201c483bd775@kernel.org>
Date: Wed, 06 Dec 2023 18:44:04 -0300
Message-ID: <87a5qnhuqj.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Mark Brown <broonie@kernel.org> writes:

> Since the x86 code has not yet been rebased to v6.5-rc1 this includes
> the architecture neutral parts of Rick Edgecmbe's "x86/shstk: Introduce
> map_shadow_stack syscall".

This paragraph can be dropped now.

-- 
Thiago

