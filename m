Return-Path: <linux-doc+bounces-82640-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN3XGLHW1GnuxwcAu9opvQ
	(envelope-from <linux-doc+bounces-82640-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 12:04:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B50953AC7CC
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 12:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D30B304A6EB
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2026 10:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128AD3A782D;
	Tue,  7 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbQPX+ZU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C2824E4C4
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556225; cv=none; b=JNYW1P9lYbmFOAVmVhQxKfB5ad7RGNiV8GLHfT4iURslC1cpiTIhpHmGOM20EOQrdpkf81UpsiBmAwzI8U5pyHIhYyQpqMeMylp8J+iBugiP+5nGKbA/HGwVowJIkyyLzhdLCC87EaY6pfnzxPmLNF8ZTEXZxPSIF3/rYLQTfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556225; c=relaxed/simple;
	bh=pXEtjwHqXcfnWSDq5qpazFXu/HXu3Lzm5hMLjmyDGz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9/8mmoTvHopNY1JfLVEFlXZH1QXge32CGik1I3gYF+pu3ML/nZcP5uC32KxxW88Y//NuqPikTYwqXifhRcSIYLVyJSls+0XZOWUKLpKrn8Zjr3M7l3glGqk83/YxkShoCwWAB61NplBTtj4yN6NO/7eq6j2UPmPjLjzjwAnfIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbQPX+ZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FEDC2BCB3
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775556224;
	bh=pXEtjwHqXcfnWSDq5qpazFXu/HXu3Lzm5hMLjmyDGz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VbQPX+ZUl/DYOEG7XwXsXaYChsmRY9PwQzHN2o3QxJ0gmEWRO0l0XogyiOTwjSbt2
	 tcA5JkF0XIWh2UQrt83esp8O9GlHdHNh565+1vs7VY40TYqj7wkCxCuuZ//59NS4Ek
	 qOL2WO1lchCNMiTmum55OiIvuGDYR4Td7vIhA2W0n0dTHBqw2xdNQK0ojDaGjK9gr4
	 9n65t03FF6dlUD0lUhHeq0hTUv8Ru2tjLzBlM7dnUAFOo2yIFis3X3Ns88d3sz4pUe
	 AtaF/oQ+t4p09uLdr2QjZVXVy/aymc58uWmlN1Yf3+p0pV60Xc/P5VscyNLKpCx/pI
	 2Zqcb7FZT9y3g==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-793fdbb8d3aso49499007b3.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 03:03:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW81TFuLx4SujgQ44JjybcBio8RnFN9QK7KCa+tItn38Lzp8QzObT1ue/ulHx/C1zQ+JSuMwATkqSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH4AhEojqT7c2tYW0eDGljxwqOqhM2mTgAFnqj6KMuf2rawnVt
	1g+Zt9CJbbWCOuJ8L1lT0781Fk0yne2RN7kHVjwWUz2dhdFkFFQtLabTvD/oqYM2Nn7Kb2j4W5s
	V7FbBcuCXrc8j8GPxTxZ8rGHx1KPX9Ps=
X-Received: by 2002:a05:690c:c508:b0:79b:d341:56f0 with SMTP id
 00721157ae682-7a4d38cf05cmr162751417b3.14.1775556224007; Tue, 07 Apr 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
In-Reply-To: <20260403-doc-gpio-swnodes-v2-1-c705f5897b80@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 12:03:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRwBJd+9QnvTRBVSdQqZdJgja8FXzqCNu0ye0smsn-9Q@mail.gmail.com>
X-Gm-Features: AQROBzCcrOGC9mYV_BDSmk9EoZKY7WEkflwtqH_mBs79DxOjvPi57U_1gfFCwh4
Message-ID: <CAD++jLmRwBJd+9QnvTRBVSdQqZdJgja8FXzqCNu0ye0smsn-9Q@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: gpio: update the preferred method for
 using software node lookup
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-82640-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B50953AC7CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 3:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In its current version, the manual for converting of board files from
> using GPIO lookup tables to software nodes recommends leaving the
> software nodes representing GPIO controllers as "free-floating", not
> attached objects and relying on the matching of their names against the
> GPIO controller's name. This is an abuse of the software node API and
> makes it impossible to create fw_devlinks between GPIO suppliers and
> consumers in this case. We want to remove this behavior from GPIOLIB and
> to this end, work on converting all existing drivers to using "attached"
> software nodes.
>
> Except for a few corner-cases where board files define consumers
> depending on GPIO controllers described in firmware - where we need to
> reference a real firmware node from a software node - which requires a
> more complex approach, most board files can easily be converted to using
> propert firmware node lookup.
>
> Update the documentation to recommend attaching the GPIO chip's software
> nodes to the actual platform devices and show how to do it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

OK this is clearly making the kernel a better place, and I expect
the AI coding agents to pick up on it and help everyone do the right
thing soon enough as well:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

