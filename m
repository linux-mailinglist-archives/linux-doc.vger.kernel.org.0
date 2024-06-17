Return-Path: <linux-doc+bounces-18740-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E990B998
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 20:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 610851C20DCB
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 18:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F55F1991AA;
	Mon, 17 Jun 2024 18:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XRAmVA3F"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58767225AE
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 18:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718648568; cv=none; b=H3Zcbwmvx5/QXMCM2JDTpJVXj3pj34F8Db9mwiofpTZp+5dK/3Ml5burC4XVVUaLNcVcAJ/BEcrfaOq+vNRC5eYBa/qE0wQIzWh7G1h+gtRxuTHQ0qlJnYLk/VSEjMh64DdK1Q6u53VYVTpB9NzMiv5CjED7MZYF4uz6zQU+U6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718648568; c=relaxed/simple;
	bh=qhSM1PBvU7joTxqhlWMSmcyf1OdS106mDM5IHpvzoPw=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=mKvjiNYJWK+HevjhveYGmQyJ7JvLFe3GB8xI726pvq6Cqy0OLYtaJyhzfrgYvTQKLgIQ9jUkB3YMX1M8+U7WowORBtKimHhPanS/SjMJwaYV10VfxVIGbqPVI185ThWj3soj2Wj9PLMtgdY5rmnSUqmZtwFx3hpTEOFHEk9tH2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XRAmVA3F; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-7ebea0e968eso488533639f.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718648565; x=1719253365; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pny2UzPtVZNTzHF4IsxaYZ+f2GCEeGNxOUJXm/PCpXQ=;
        b=XRAmVA3FhMsS0UU3/qdRDH9NESEccDgFX/R4F484VsbxHaZh5b8eWHSG8bfjsXuzmP
         uAP4hzjNxnAyTOOKPk8KduS9cr2ir8qKRpTCiykVHxJPWw1eL61JHRy0ZtgM9Z8xn/OW
         ZgcIl5U1Iopuc9YzmAaSLAmzvwX6gfwkwdopTVmEb/SEbEKfa11gN589hKvcbIiY3TkD
         yqp89AyTTZGWi0c+ABmiFx59orZAG+VEciaLtXujWl0rsBnD12z5j10bdsLijjVFV41e
         3rciAvwxOYn+bi94JStgdJj8XTDmbJAEO2Cd5+M/Q5Omr8WY+fEqEqagO//ormMLplMx
         Az0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718648565; x=1719253365;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pny2UzPtVZNTzHF4IsxaYZ+f2GCEeGNxOUJXm/PCpXQ=;
        b=ImdIp3+lhQWz9AyAGkVLsv4gHE+rjD+/WBL+sfH6s8+aCIpqAMqKaLDO5YD7zOHGKr
         K/MZwudIm7fX45csLWil3UKEXlT/Biw6eb/d13ZMzHyUFnLere2mnucocletwIFJR1kl
         I23m8q9nfWXCLUa7DQi4PaYBEo4Oe6evPkwdS9TSK7PpbFNYs17Qp8nxuCo4RKsGlFqP
         0EK8RbumuV+xkn+Qns53akp0g9HCKgUT5cvVK2kiqxuvafcMVYYBTUDZ61b/jiFZqKH7
         c9Hom4Ak2Y47tFsIruJvAjCCnFdT0IPYSTfeUajZCbxJ4wUvPQEs77iXlmJnh8CsDb97
         SLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZhDV2vfaOuy8zFM1CKSsKJ4fm5NURV+GAdeTsY4z3b95a3bo5Q3V/T0XwuyJyqvnyD84Aj9zbgjUGtAPOg/lM2M8CTH9vuTnV
X-Gm-Message-State: AOJu0YxW6fZh5oziJnlBa1WTSibWy10bLNFxDM5K4QxiGdVuKM5uJKIL
	L+RA6PLoSHFqeB4tP8k3j8xFsVTYYKw0Y0TQn8qO/SwkraTcGgU0960QkDQFMXR4fxN+drf9azH
	qsQAm357JIGWoCc2fC2vEdA==
X-Google-Smtp-Source: AGHT+IEjud4xQdH2Jdh7XuNPZ20RXq/rHRZKEIbMLpx/a0M5UDBisxWRfV6ZxH0660BmRU4E5fKorzt/Ng9lgPN54A==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a05:6602:3f87:b0:7eb:823b:9583 with
 SMTP id ca18e2360f4ac-7ebeb638b3cmr21918139f.3.1718648565639; Mon, 17 Jun
 2024 11:22:45 -0700 (PDT)
Date: Mon, 17 Jun 2024 18:22:44 +0000
In-Reply-To: <171839594069.633615.6902666817551787618.b4-ty@linux.dev>
 (message from Oliver Upton on Fri, 14 Jun 2024 20:12:27 +0000)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntplsf5szv.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6] KVM: arm64: Add early_param to control WFx trapping
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, yuzenghui@huawei.com, 
	linux-doc@vger.kernel.org, catalin.marinas@arm.com, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, 
	linux-arm-kernel@lists.infradead.org, james.morse@arm.com, maz@kernel.org, 
	will@kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oliver.upton@linux.dev> writes:

> On Thu, 23 May 2024 17:40:55 +0000, Colton Lewis wrote:
>> Add an early_params to control WFI and WFE trapping. This is to
>> control the degree guests can wait for interrupts on their own without
>> being trapped by KVM. Options for each param are trap and notrap. trap
>> enables the trap. notrap disables the trap. Note that when enabled,
>> traps are allowed but not guaranteed by the CPU architecture. Absent
>> an explicitly set policy, default to current behavior: disabling the
>> trap if only a single task is running and enabling otherwise.

>> [...]

> Applied to kvmarm/next, thanks!

> [1/1] KVM: arm64: Add early_param to control WFx trapping
>        https://git.kernel.org/kvmarm/kvmarm/c/0b5afe05377d

Thank you! And I will keep your comments in mind in the future.

