Return-Path: <linux-doc+bounces-94031-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /DoZD8yaQmoX+gkAu9opvQ
	(envelope-from <linux-doc+bounces-94031-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:18:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD286DD3BF
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:18:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94031-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94031-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76BA230D30DC
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E55644A71D;
	Mon, 29 Jun 2026 16:12:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B5426D1E
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 16:11:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749519; cv=none; b=ttYpWzia9WTbbP+z3oCv50lQcyAAIyjGjzAz33U99GehefQ4lCKnYO/zFkjlFmd9hifEwFvHIw7lZlmTgKFwW6S/8F67FT08kJSedKOqjIi/X+NJRkTKo+Icxydz0KD27/IYTQxevVzPUG9Q+j8+X9dUM7B/FHL8OYTtWBZ0dHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749519; c=relaxed/simple;
	bh=sYueyQ3bw2pc9KLgyJ1cpdzkyAoFGk1EpCG2FN7G3E4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/2ZEKeBfvBkDvccfpmEIRkhgsUvZdeh3ZbW/GglGw5CI7wNKJnsSnuRIJwvPjg2uQ8SW+rrJ9AaM2+GmxSBn/CFD6qWOZozaS94IJKOkvQhiUIvXZZ7YTypq0mGjOFrB3owQtIsTQPLeglnvqvNxd7WGmasLH21UyiRhtf/U64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bbe617d624so2586914e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 09:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749518; x=1783354318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cc1AtD90QbYvJ0NtvKbjq/dL60nodyrS0aRkp51E1w=;
        b=Ha0FIPIdD82PSfzAVBxaK51+4M4xI7KCoPl2NHiH1n4ds/J2j/7O/bjOSrT1RqqHji
         k6qJ/o+Dcz8VnYTm3CLN6IDMdvDuf+qE45GGuIKhhYWXgOcYDEiz5NgZ6hyj6LLNPF9b
         ZQRHHPkhEtj+TOmc1ifwe07apaZHNvUbkk9YwweRCuguOqLBwqOEE15FNrVTLZggFDI0
         04C5HncsFSCcsgk1vO4xJe8D3SLD24mGr4iXB6v/7Vpxhkan1yQuW/WbP57XYHd3AErq
         o6Pz5HzIwbvClJug/9q8XDlju5NQq+qg+TvCcLERa/EmdxoyKPRjAXNWHQJKc0pOWaBP
         BAsg==
X-Forwarded-Encrypted: i=1; AHgh+RryZIXdsBqRukb9ru+3zfe/beKueKXSwx91//a4gLqP6saUpupoTmGkmRd4Fo+PCjNHsHl5bkgbu+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvR0eFionn+C5UCixBOrS12GxDKJbS1nURm83UI3W/CbKWq+0y
	dCJXFMxgSp04tjCzw8m1JqWm+ZEB3R8tj8v3Fg48PwWUaqT69y7Ho0vCBzaP+Rg1ifA=
X-Gm-Gg: AfdE7cmUBJ5zPTrNNHv+exj2/akzW2Z9rUsGbwg0ME/Z6tfuHTcmCtlmcgdipCbgK+U
	iBKfbMsBcRjQS4LiXMOWB/Sp/NR6X/hKr1+HmePoS8eObXcPj/vrAVKSnAX6WbQZEnsMWjr5snK
	+/6qfQe8m/6MQdyHvB7Osp3sejRJcq/uw/FmFcsayUfOSMB7pRWgFxyx6GfWedc6CS7u/RQ9ACQ
	dxbddma+Celyi/ef8zcHYN9WS5vs5XrcF/YPZZl2x5v8WQ47G6n1Ri83+AH/+8dSrE2s16clwb+
	q+Lfu/MfXUMBTTEkCa4s+zFzOv765GTGVScb99oeQxJgET6LoSVz1Tns38NjiU5TeZDkuO3SjkR
	rKVIPFm0BZQElUGSMtypHRn9uwo/ixJXd9xdQj5IjW6cOEGmW6qph0i5nqmD7YUsKBRa5+x2V7F
	3QV7A1NHs3J14lCyn93e0DhAJSOyP9vZoU/YhUenZv3hH9arKDxofEPdemxS7xPl+m
X-Received: by 2002:ac5:ccd2:0:b0:5bb:e5dd:d93d with SMTP id 71dfb90a1353d-5bdbfb47129mr52005e0c.0.1782749517749;
        Mon, 29 Jun 2026 09:11:57 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdb21e23d4sm1163635e0c.15.2026.06.29.09.11.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:11:57 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bbfc48715fso3658615e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 09:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5aD3LTxaomPQXOmqWWM/5igq8Mdzmubt53pfX0Xk7hRl481dVlo5T5I2/e4U4SSxnoXQZH5efgxk=@vger.kernel.org
X-Received: by 2002:a67:f887:0:b0:6c8:c356:16c9 with SMTP id
 ada2fe7eead31-72f860dfb7fmr8915583137.20.1782749516783; Mon, 29 Jun 2026
 09:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627082921.1709181-1-david@davidgow.net>
In-Reply-To: <20260627082921.1709181-1-david@davidgow.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 18:11:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfUWBQqsErAA9KAv_ReBEKVjXq-eSpYxvjd7k=HYtDMg@mail.gmail.com>
X-Gm-Features: AVVi8CcD94Y5dYPobw9El3FE0Lv2yFLbfnthke_J1JTWNkKZe4jIUyESMzVEK-g
Message-ID: <CAMuHMdUfUWBQqsErAA9KAv_ReBEKVjXq-eSpYxvjd7k=HYtDMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: kunit: Test Kconfig entries shouldn't
 select other configs
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94031-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:david@davidgow.net,m:brendan.higgins@linux.dev,m:raemoar63@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,davidgow.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CD286DD3BF

Hi David,

On Sat, 27 Jun 2026 at 10:29, David Gow <david@davidgow.net> wrote:
> Add a note to the Kconfig section of style.rst to use 'depends on' rather
> than 'selects' for dependencies, as this can cause users of
> CONFIG_KUNIT_ALL_TESTS to suddenly grow unexpected dependencies.
>
> Signed-off-by: David Gow <david@davidgow.net>

Thanks for your patch!

> --- a/Documentation/dev-tools/kunit/style.rst
> +++ b/Documentation/dev-tools/kunit/style.rst
> @@ -164,9 +164,10 @@ This Kconfig entry must:
>  * be visible only if ``CONFIG_KUNIT_ALL_TESTS`` is not enabled.
>  * have a default value of ``CONFIG_KUNIT_ALL_TESTS``.
>  * have a brief description of KUnit in the help text.
> -
> -If we are not able to meet above conditions (for example, the test is unable to
> -be built as a module), Kconfig entries for tests should be tristate.
> +* depend on the feature being tested, rather than selecting it (so that
> +  enabling ``CONFIG_KUNIT_ALL_TESTS`` does not enable unrelated functionality).
> +* be ``tristate``, unless there is a specific reason that the test cannot be
> +  built as a module.

The addition of the second bullet is not mentioned in the commit message
(but I strongly agree with adding it ;-)

>
>  For example, a Kconfig entry might look like:
>
\
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

