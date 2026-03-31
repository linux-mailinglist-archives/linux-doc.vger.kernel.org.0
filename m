Return-Path: <linux-doc+bounces-81890-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BvsIk8JzGn+NQYAu9opvQ
	(envelope-from <linux-doc+bounces-81890-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 19:50:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777136F612
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 19:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB1B730DBF73
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 17:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6D734107D;
	Tue, 31 Mar 2026 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GtScww03"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC234166B
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977537; cv=none; b=q09i5EBAKf8yoLh6PuWP3IZzjkO+iN1gjtl7EmqGHi3VlLlAOTOcVBNQc4jguZW0SctSgdt+/oEirw9sm6I8QC+Sost0PjS6cFulHQkOZS74DXXu5xVYnFoLDM/WCcs5Mr8ohb4YU8lknrfVe2bzyo5DDuEqJc0rZGY4tDg1Cxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977537; c=relaxed/simple;
	bh=6ac9F4nte1Yiyo3mPmvL0jRUpnUVgMzCJ+yaIK6fLrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaUkP6mZBO7EYzAKTWcnq+ZZEAt72vLPf9ICRzJqk49m9ackmGK4WLzS7ROAmfiLQUmVO70jJlO7+DrN4h3GmzOOVNqG2QT9tDWHQsPVyL4CpyIfTjuuWn9gm3iWZjRCOsACQQtKQJ2W6RqxKMs1FPfhCu5m0JZEW5Ddjz3Xs0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GtScww03; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c098328acso79154566b.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977534; x=1775582334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4f6EWJpSf2F8Fa/9meaVrgxvLf6j4eAN5dwsMo8lPrs=;
        b=GtScww03pFgORotIst0RaygJ4xUlaG+Fd772YnjSHdILzAqzaMC+b3kgchAp1igrUJ
         zWy4pmOpyujoFcxTFqjYluOLDVw9q9NW2cWCbaxIvLupraLFxsOVjESsR09HC3MryDGI
         gwxNYml8lTQKMnlC1JsOVEpH5INs1Y7gL/gOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977534; x=1775582334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4f6EWJpSf2F8Fa/9meaVrgxvLf6j4eAN5dwsMo8lPrs=;
        b=lQ8vk+i6PFsMcaJgEkR3zpO+xZYBBp0mn2cxqMcVc1eCjCoh9LDazyq4uvta+OND5R
         b5FqBHvJN0ww9lyZ5bCvsrmDeiyzjh4SuKp/Z3zmJAIQOxc0Lnt/wPdggWR9saps/fyX
         340Gz0MAjd2VQDKTfP8jx0kSPvZ8U9khhS1ojxBDRRWlJsy8Yyk0aETTmTre6XUa20yU
         XOVQyQbvz1IIJx+Dv3cCLRn/uzidfCznJMT5GkoVMABRLXl91rL1Mtfncq8d7xVNow9a
         M1FKGrgviFfRoDzbVRJYN8g8qTy2NRE6xgr4oeUE8no6J+of5WvaBRD3N+cOoyj7pJ2C
         F1zg==
X-Forwarded-Encrypted: i=1; AJvYcCXotCrkOMJIZB3nyhgEQqTo/CvkBQk/ecrfDQoEf6ZTbLDHfuzM4YtDdw9YIWsD2RFfutpEbuzdMCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvg6mcrQ2U6sn/QisJv6K+PZxWKsyORfJE9k67X31j9qHfuLOY
	PDbSKrBZYnOsq4VxtGhC57m2gHajNerolv2ARxE7DVFFYtTBp01q1mma2eaqdn94XeX8sF3/CMw
	j9E+w6PDOIg==
X-Gm-Gg: ATEYQzzqeLtvjk2zHkwnG8I7lxpepfwbgOGq0VE65QXyRzqDtm7woWs7tJirRkwVlCk
	7mpiwJzeIYoFJbQwr47Yz+m5mhE/ZIwKCTsOkugK2CZNGWUompOMuVty2J16Os+B3T0TsCMG1oL
	6pJjSTccF3HxGzTUXvK6+KaD5SHFvotolulsucpQV+30hTaG54GH7vJB3yaMXEujwgpM9dpr7G4
	VaqYdkkaZP3BzdvIXfso76V1Lzp+KL5ZQ7JEkc4ce9bt8ROkxu9obILMlj7mBW0+J4luBDAM2c6
	2vQzEmksvMKz7nmFsYBKn8myAK7W0M5v0pMmn0SMsujhtG5+2Zw2mT8qrLDZQkP38MrWwI+n/wp
	rlsw2ocvgJdscMrHegOg8ywNMK1nkAyJ7QxWfEoag9LV0WgyWQjmd7/NBWB2toi+QPOFZ1e8zpL
	UJ04rikou6C2j07z0v0acJy0vZQ7j7iSZn3JXHy4TentLIPMfTmcmC/H2khvS/dsH7JYWP7XWv
X-Received: by 2002:a17:907:d25:b0:b98:5547:3de4 with SMTP id a640c23a62f3a-b9c13b2b404mr36432566b.33.1774977534069;
        Tue, 31 Mar 2026 10:18:54 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b2253d4sm436323566b.56.2026.03.31.10.18.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:18:53 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66bf6aa4858so4026111a12.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5EHVwAnsCxwE46qJBEp6kyu8kMCsPRszj0SaNAFb70imGVYsK4wH4rOww64auBzFisUZj0O//6wk=@vger.kernel.org
X-Received: by 2002:a05:6402:43cd:b0:66b:b46f:cbee with SMTP id
 4fb4d7f45d1cf-66dafead9ebmr239737a12.4.1774977532763; Tue, 31 Mar 2026
 10:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
In-Reply-To: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:18:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfF-T-qrvL567DYD3ymqUhEXm_455CS=Xqvngjucd+Pg@mail.gmail.com>
X-Gm-Features: AQROBzDZPm_0YIwJ05O5Tx8cRSfkjvtMjCTPVCmkYZWKjM8JxXDJ7ksIZ8sr0Tg
Message-ID: <CAHk-=whfF-T-qrvL567DYD3ymqUhEXm_455CS=Xqvngjucd+Pg@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81890-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,arndb.de,linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-foundation.org:dkim,linux-foundation.org:email]
X-Rspamd-Queue-Id: 9777136F612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 10:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The only safe trapping behavior is something that has a clear an
> unambiguous and simple to use way to *HANDLE* it. Not just "mark it
> trapping".

Side note: this is the same kind of complete and utter idiocy that
made Rust people have allocators that abort when running out of
memory, because it's "safer" than returning NULL.

THAT KIND OF THINKING IS NOT ACCEPTABLE IN THE KERNEL.

I don't know why people keep doing this. Stop it.

                   Linus

