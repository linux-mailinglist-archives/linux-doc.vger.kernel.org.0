Return-Path: <linux-doc+bounces-81886-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKnJJTEEzGljNQYAu9opvQ
	(envelope-from <linux-doc+bounces-81886-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 19:28:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF236EC4A
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 19:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E98030B6BCD
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 17:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAD7314A86;
	Tue, 31 Mar 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j69l9BA/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1209D31326C
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977292; cv=pass; b=WpLYbVlLIv37FPo4L1MgPtCqUrpDZMMrCv466t9UwIuRU5hngIecqeVn5T1EmTjqc9f9+Ju0VRzyWqkLLOwNtmIRTc6Fcg6d9cmCCIriAlMozBiTZtnuEr2WbJwOQjlNOQ5tFZmiBRzDmbQnz2PCeFz/tn9jcoBM3xsmmT2XUPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977292; c=relaxed/simple;
	bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TisDO3qQU7s50/uWcVBHwgmqOJbWY1ASqL2beIhcvCfxmOuHNhMAMEpBDBX36Vk7uf3fNmGmp1yAQ+flaVWE9PIc2GHBstFYbmXW+AbuSbDf0WSDnl4mQ2+1pdlIXA9Kp8JISi9iOkucDsmK5xThvAOeIvdT+5ivXLC8YphYPRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j69l9BA/; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c44547f6d5so144120eec.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977290; cv=none;
        d=google.com; s=arc-20240605;
        b=lbIa3qyfP/s2wpI53g2CAn8h1nVrQpzWXzSpqB8WdT8Rnkd/V6HXB0z2l0j3m8WOB5
         nz/JJbngMB6jfqeVP/0dIdXC3RPdSCnPhPP9Qi8GAKEYDOATTK0zGkbh+pc46BuRlJFK
         9OM8vDK6tI4sv0BPv7gl+T0aMYUnu+wGlfUMPvA/JV7mklvqifDZWfWjkEAJNyqU1ztc
         wzQ8Mp51mGXlYaamWWIzxf+or/Tf7kwz3tbgo+1JXTnNwtGh5NecWNmeogBxic2nk0fg
         SQ9v29HWxi5K97BhHhBJnxoAeMcckBfCdkR+PSGwbnzXjkMZ5OkJZPpcb1UoXK0/r1KU
         Wd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        fh=dFP//N630Vc9veSj0r/XbrMCVnJUy3TbnrS5D+QMyTw=;
        b=RZ74mWHNB85SmD92l7UvtunvypW83svtjKvc9s3FwKFLoFZtz/6ewFBJm2wshMHlZY
         MBh2hyqZB0mi4N3zaPZOlgcUzjW6tzayO6L5SvnwgsnU+/gnE5NrAcY6+6F/GTzF4Bnw
         +Zh7bNSKbRMu7fp2AL0DPUd62WSU7KX05SUdjpAD+Axo31Uigtf1ue5i0HeJHV0OGrTO
         OqVs3BZdpLng7UQZ5FXeJnDdvO1qnHe/pfRPbyo5W6foEa2TmHmPPJgcvOWAERx9bjlF
         /NItMjbQG4IL6AYn7ZlXvImoiCfkXvuV5WfwM7zcadium9IwLdY0hiAcGF2CGGDW3ZqN
         Z9eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774977290; x=1775582090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        b=j69l9BA/W/vb+ZMCguLW/f+lFajXySckHWUW+FCngYfO2RF4QZGegBrfUHB5DqZYdB
         kR9wgLgl0MLjWDtSgc0YK7Z95lt9F5Ba2OYkB92SgxLj8dGMGBhfChfa9Ey6YMlnNrg+
         aIfwCSHEwYw6POj9gtRv+lWb3gFXA8CgXZeqpM1LL6uPVHhTl5s5IHAdBBcyJ2lsjHBU
         +6+T14j0FM5GPctPR4rpBwCxATQnYenhfli3CLe8LuUTdpu/X6yJgVdBTSxcN3qnVbqi
         d9bzBjjd+cDOWGiTwMjfEBdo0KqnZfycqlzG70S3VASA0Y4W4Mh5NgtZiVmvKcAmHdLw
         XWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977290; x=1775582090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2O4CeHp6Qi+il6t0Xb3UEnGL0DA/23aBF3dyaOzbgrA=;
        b=Eby+ZNcsuQTdrF77tvgzOL8LyrBRYQ4O6p9x8E6h2IX28MhIpsFJoe8oy+uW8HHKlj
         afGkGrc1Ej7JKUOkNndwzHylii4hVGiMgjM/Rx4DbnI6kFu6oWuoGEVc8gvMGTmi/I0q
         P3tqCYBEeIxeYfuUm2ebrW/AhdsdVIi1mHHYsvE6582tFU0X2eM1t0J0szB7JeIYjYMe
         v70RrChrkAQRuWuVx3VOYVacLOOkF00gxwIoJlRPaX4Df4zUtQxC2yZzTsEhYoRxLRXa
         3Cb0gIgI2Wjtm7npw3eNB8mMq9cKPOvmLxp5/sjyC+1rbxk/+RYopwwGs6ooFpw+S1g3
         rLdg==
X-Forwarded-Encrypted: i=1; AJvYcCUgw8GiLRw8KN7VU24MlvE1CH9qw4znyBTzYlG5JuprMKT6PzEV3XvqGoCUjQW6FoKSHIvGPbjydwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwljatCPjZU45mCYZKH3BjwC7+OlUM6tjEC2bAbO9lBAH+KI/Jx
	kGGJpYWsTtCrfxuV7FjC9AEjebKkqVb0F4vLsi/hv8cXW//bUMl0qDoxA6rlYuF6Qbej3OE/Oc2
	+fZ5qhKG+YKymY/Fdoardw3BaV7GZF6w=
X-Gm-Gg: ATEYQzyCuD0OFn4pDE6HAkvzjlNAAzTz+6ff+lFBInBgO3RXyLcNXCRLNgj4WnVrvyC
	F4qY7tCH8oL4onBMDB9LQZVuAG02hA3A6HoUIehvVYJDUWjCnHf0F5w8UWS5lhQC8ayqZJcqwjd
	jMNzYPhLVE//v6+sJs29B9e31Nl61Ia1p1spbEWLd9FIRqVRtFJyOwdGMTFVlj7k2vsl7Q+r//G
	Bhqvrz6NxqcujAXoU5CRphoHGdmKKi3xVO10/aOH8Wg9C3el5dYiVCQC4PloCPMan+7PDcfV0hN
	jrwzcUTlt0kK7vtKgKjtP07uZLjw+eUbBa6tTXy/ZJR6Tponv3tDvXhvXyRY+T6Yo8UVoEFlVbQ
	LTScNNmCUI3ISlSg4L41CFq0=
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr7028eec.7.1774977290081; Tue, 31 Mar 2026 10:14:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com> <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
In-Reply-To: <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:14:37 +0200
X-Gm-Features: AQROBzDhgoRzvErl2Hff4GGNXVWp6S_FczTi75dcVGu_6O4eHFWwYHMrEyNGrVg
Message-ID: <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81886-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50EF236EC4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 7:09=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> __ob_trap and __ob_wrap are defined by the compiler.
>
> There are some examples within the documentation additions of this patch.
>
> Kees, is it possible to make it more clear about what we expect of
> kernel developers in terms of style? Should they use keyword
> spellings? attribute spellings? only use custom types?

Yeah, I noticed that right after sending the email, sorry.

So I tried to use a macro even if happens to have the same name as the
keyword, since that form is a bit more flexible, but it is fine either
way.

What I would suggest is adding to the comment that these were decided
to be used as keywords, and thus we only need to define them as empty
in the disabled case.

Thanks!

Cheers,
Miguel

