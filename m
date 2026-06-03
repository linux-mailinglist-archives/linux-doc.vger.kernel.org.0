Return-Path: <linux-doc+bounces-90791-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /xrSL21hIGpJ2QAAu9opvQ
	(envelope-from <linux-doc+bounces-90791-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 19:16:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A263A1AB
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 19:16:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=kVC8Ys4p;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90791-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90791-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2AEB303CC0D
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 17:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4303E9C08;
	Wed,  3 Jun 2026 17:05:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F93DCD92
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 17:05:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506343; cv=pass; b=XMc615l1wmRkxd7XR7nkRULDRpZgw07JTNKxeE/dNWPZS4vaeLwJeMXC1TXiF1mkV5E7YbFRzInXmvKp5GZYzCHhoe6jZVOiDcC9WBbdb5RYXVk/U5v5wkkAa6Px5nEXcbzX3Ko+4SjRW0bpVnNmqhbltn0wI5mHvd/T9yu6Js0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506343; c=relaxed/simple;
	bh=OIFhnEobWG3e0FwGwtUj3ntnAyj3+THBltmf4yuxkmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xf71wH6SWIGYoWxpT1lopzrAzbsZwxk9AR73U85e3AXwJIvuUDh0tTibiPbd4OUg7bhcgk4Dy9THbx50CtPbjqfbBvyDzyxxFCFVZKZzizvYeUfOp0rkOWXo+KtK5vI89SaBpDiMn1FoBjT4AwsyXoXsfTr0gXCZZPM1pqSBAi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kVC8Ys4p; arc=pass smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eec22fab7so3685587f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 10:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780506340; cv=none;
        d=google.com; s=arc-20240605;
        b=JFUYbDhLx7Vi6mnTt2XTXcyEc8goXBTxiB7zjKX1rTcZ5A8T6rlnJpHUhAKJfou36n
         RskF0E0/5eZtv7C1Z0LLNl9Hirw9tsFpvzJGYOuYlVIZEEytxfPxtxDcV2jtChjz/aRT
         4p6kqVlUvDBhQLOhpJnHG3RYiSeujHqfNF3yEdGNq9cKJcT0UC5XwWyyJyoqa4YNIaWY
         96LeCzrcA8qO9ldwVtFXqx+YIShKaEb7TPrH2edU0oJWJzWvJinBvt0XDxqBIgrIWHaJ
         8SSgRjGnNgQvdV5eRSr2HVy9M5JI0lnW3Q8nqlx0qaMNrt9BZLOjYhD+p0yc/AypS84x
         Q4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99P4LWdJbcDOrL41XNBsTy6LKaWjY+F5jM0t0IHW7Zo=;
        fh=yp0fPj9NR9VNdgz9RGZZX6p+20aFKwLMLGSWt7jUhZ4=;
        b=aHeLqWzSy1hjyEROBMToWsGKvZCAaW7+QUDwx/gN7iLeI24y/f3doS275omJW5Q5ZB
         9JUHeoJPz4gjBlLmTICkKlEwe0IU606CYQes+5nUHtUbYHxcSK3c1Q/oN6TwpY2FQrQw
         aoCEqK9bd1IYqbQy3XjCRVunXAY5+eRRDD3HIm1/RpegGMttIfvIyzk7GtuFoRa2IrU9
         uF8t+qwADNBN50Y03Xg+47YPxkOH6cdY1U1W/dI85cLau6/DpwjHWs45qF8L3j8c/1DQ
         SV/BIw3OgWMOTVSJelrOoJOkz1uRy9GbBEub4R9q315kdQ1DptQBlViMjqm2rcCq5uha
         fNoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780506340; x=1781111140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99P4LWdJbcDOrL41XNBsTy6LKaWjY+F5jM0t0IHW7Zo=;
        b=kVC8Ys4pAwxEGhxkNwtJR/HxDxgr1AR/tcyYd0m9iE38HEDmFv8C8Mm0b6OZHSLHUN
         M80h517YCEmDFGMOriZi472k0vQos9vDTxcwHPUcFIpiThl8koty9ppMht1Qi0EQzMje
         0weykO51ZpMJ5HkaYDdefsQtIBee43c2tBnn4nyA0RN9+A2iN1yPjKjbt74mvzxDGvXw
         a7x0VhXfm+0/0WOWiDRRGzPzEQON905hp/g9F/4Cqn2DtrizPk5urL/GF2vIxXNPbh80
         QYlvROesl0toC0QSIxR4784bcLKRPrS2h0I2GGkpqqVXRMGrzOkaXD+Fwz92Rmm6pFQE
         nblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506340; x=1781111140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99P4LWdJbcDOrL41XNBsTy6LKaWjY+F5jM0t0IHW7Zo=;
        b=a8S4wHdoov7LW22vjdmBR2nH7EGHIgoSQc3ZtCDijRSSnn7f/C/lZHgbsyEruualc7
         S2jtl5eRLGf3S5VkrNFPYLSryPnm3raFjXr16sWR5FGBSJ9t8OBXzr5mVvPy+9Xyp9js
         5NW1cXRBikbA8Ca30VuvTiprVc7yp7L+Ly78KMYTqIsj2HYVsqdkvxQ/1xaaZTc4+ih/
         6JU63y2xbV6HEqZkS/BOmLYJLtIFbcf+n9Mz49uOXEK/vGbo/kaKzvZNgML8enQ1Erzu
         eRkoa/kSujIVZgV2BOU3otbRrTz5sIzfjy8+G3g3LnyXLyFYtY6h6KvvpTNskg3fRKjd
         8n5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9QmD2ib5Rrax8yTjEOEOnRl/TB5eR6hr+1AL/V23BdLETtyOUO0T6RbpJbnr/iwpEZVzMkVgrwdu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVz9ESSbeA+87JWN+lbBfiYyL7eTojbg1AMJkAJ2tRURQv5Z9
	IO7D0nwYW1XY6abeO0DEL2cvs4PooiHSyXh9GxoQqjchR5OaYsTfqMwTT6CNXL3R/6vMISIwR++
	E6WMKovDQ0pYjRx2VT+ZqQSNh2g3UVnwT2HIdjI62
X-Gm-Gg: Acq92OE/QuEUQfKItSpoqrrb+SN3eV0tbwizQp8+aPzOxeHQTbVP2UmGXcTn2gEK4AB
	3Igr8PDvR6VplYwIa1ho3JNzu4dIrOO+IqDPngxXMhutOeEp58dQoGakC+LAQMo9w6Z8fdqu8lH
	uyljvDsVIl/zoTNmrREQwG0AD8O+OrDAVeSirIySKj1gfvYR55CvLGJedVM7GftSi1xyN5fT10X
	6QAxyBh43lBQbkD/zmvVqGWxGySd5g13ihFeNx2532OFa5e4QsZQbuz5Tpt7TQS+Y8EdyIsag3L
	zZGnWT3v72zdm8HtJbgpU0hDW28Voc/8xYd5AjvP3/eD1+Gbn8ZcmEBtsk4=
X-Received: by 2002:a5d:5d0c:0:b0:45e:b99d:dad with SMTP id
 ffacd0b85a97d-46021872abamr6655166f8f.38.1780506340089; Wed, 03 Jun 2026
 10:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
 <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com>
 <ah51DY5yfaNZejBd@google.com> <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
In-Reply-To: <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 3 Jun 2026 19:05:27 +0200
X-Gm-Features: AVHnY4IAFJzjseBdCskbFEe5vMc_zEyWRD54e3gHX3Gz-NxzZYa3Jh-vbKd5Q9c
Message-ID: <CAH5fLghJaFXheAZqKyM9Cdo6iqTw1W=haA79POhmZWEfuKujRA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:sergeh@kernel.org,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:skhan@linuxfoundation.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:jannh@google.com,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90791-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,linux.dev,hust.edu.cn,garyguo.net,protonmail.com,umich.edu,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,paul-moore.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 189A263A1AB

On Wed, Jun 3, 2026 at 6:05=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Tue, Jun 2, 2026 at 2:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > On Mon, Jun 01, 2026 at 07:13:37PM -0400, Paul Moore wrote:
> > > On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > The task_euid() method is a very weird method, and Binder was the o=
nly
> > > > user. As of commit 65b672152289 ("binder: use current_euid() for
> > > > transaction sender identity") Binder doesn't use task_euid() anymor=
e,
> > > > so we can delete this method.
> > >
> > > Given the problems from last time, it seems like it might be prudent
> > > to let the commit have some time to "breathe" in a proper release, I'=
d
> > > suggest merging this not for the upcoming v7.2 merge window but
> > > instead waiting for v7.3.
> >
> > Sure, that makes sense. I'll resend after the merge window.
>
> No need to resend if there are no changes (see below), it's in
> patchwork and I'm tracking it so you're all set.  I'll send another
> notice when I merge it.
>
> > > > My suggestion would be to merge this through the LSM tree.
> > >
> > > That's fine with me.  I'd also suggest updating the commit descriptio=
n
> > > in patch 1/2 to indicate that binder is no longer using task_euid();
> > > it currently reads like it is still being used.
> >
> > I guess this occurred because when patch 1 was written, it really *was*
> > still being used.
>
> Yeah, I understand the world has changed since patch 1/2 was written,
> which is okay, we just need to update the commit description ... which
> should be a trivial task.
>
> > Perhaps we could pick up only patch 1 now since even
> > if we run into problems and Binder has to go back to using task_euid(),
> > clarifying the docs is still useful.
>
> I assumed that was one of the reasons for splitting the changes across
> two patches (reverting patch 2/2 leaves patch 1/2 intact).
> Regardless, we're at -rc6 and with patch 1/2 being purely a comment
> update I don't see an urgent rush on this, especially considering that
> if I did pick it up now, it would be for the v7.2 merge window and the
> binder/current_euid() change will ship in v7.1.
>
> Let's update the commit description - you've got a couple of weeks to
> do that - and then we'll merge everything once the v7.2 merge window
> closes.

Sounds good, thanks!

Alice

