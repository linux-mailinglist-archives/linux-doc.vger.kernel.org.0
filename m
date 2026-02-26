Return-Path: <linux-doc+bounces-77183-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBJDC4cYoGmzfgQAu9opvQ
	(envelope-from <linux-doc+bounces-77183-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 10:55:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 378CE1A3D08
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 10:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BE5E307A569
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 09:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019C4374179;
	Thu, 26 Feb 2026 09:42:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9F2BCF6C
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098924; cv=none; b=tIqo40dsD+D8wWNKeT0pXxp5cbdbRly36xY+T0KHzaXwRdI7h7E19oFhgFZJ61VMJ9j4SewLbo1HbLHuxuKsvdNglgrj562p0RP0ARlrLb52A7dBxKSKKq8ERNxMUbiIOHUylnaQ2MZHXCFuSfEd6NstymJBjBX77Mir60Abacw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098924; c=relaxed/simple;
	bh=gKdDRJ4k87LaAx3+R8LuhxvDrJ8opW/pPfIrEoH1PWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQ2V2T9nkaxISQgnccSXPNYEY9FBN7Fepj106FzaNewj6VlDlKuigKpdSrxddhoeWcZ9hSmuEdRzXOlNgHbjkbZ/aEQ/rJpxtgSDW07KJYH2+qWoUIzL+T1T6HL6wswOaUugZyT1hgJxwyn4hCznwzkGOgrZaWOrEaIBmRgaxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdca815fdfso500031eec.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 01:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098923; x=1772703723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN7QFDReg+d0oErhjLdM9CGSLPE5PA9L2wZop8EojNM=;
        b=M5tAwwADJrsiW/qLkRE5sj7K9hLcaDnX4BnIO8fUdu/ZJNhDjeLwVgvKBBG3VAu3Rw
         5OCpBhnyBelz8GdHvtCVhmiqi8bMT+fgUK+E47u6QCdFaKaKkxtjN44PFXX9pfkc5Xxa
         rvK5G97ycAhi6xyRokOOHPiojWxQ5VI8lcRwtYjBdmBlOjtgl/77YkdE4gm2aCK0fK2I
         mSOM+LjvUHYXQ98xAZFxkGWBgr9WbVZrvC1BHeQfLv5O+oFhPvF+lp7+DpxPYXmUN1ty
         fb9tRaOyQ0tKJcX3tNO7D5mrjDmhxKuzJK9hT7Cr8juf2vuMM/j545UV+oRt7VTIprwh
         +9AA==
X-Forwarded-Encrypted: i=1; AJvYcCW1gCx1qLw+V2tSetO5ddvL5ySKI2szMxBNB853QKVER8crLaVyXXNZLhfOMfX2OPHOVqbOBC8eugE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6H8zIb+gRQE7LloZvBzk2pWk9i0aSTdqGyaGK7oLlvotzyyZn
	k4oiS1MGmBq+qa9ygmuj+BVT5cFy30mJdi7F0oFrL3Xzv6Xg3fgSflGeb8Yj7g==
X-Gm-Gg: ATEYQzyU5lkAva1nNwRMmxiJv18g/3b8JFeK8yXbvdH3t+sCcD9zK/FMXkewfMairHI
	KUvDX3ObN1FwoCEydZAHADvghAxtSn2w+v8lYmNMrY23+OiDC0cWpXKgZj3y67PJLOfO5wcOjiX
	sUYGQN8ypVmW5x+DgiTprnbZ4fjwfNlrJbQm5UqNmXI5zBcCmc+hiXQyXzY9XIYbAc6g5fBzfGP
	DEgzpUMlfBSOClM7xo4RQYukBIPxnJ6y5q5wBdR0XUYnU0DPjx/lVS0YE2CrPyWi5mbzmupYUCW
	MGN02FNyebAXSrOurBAMV3maW8aSa172bA9n83tud8yDkecC3GmqSAveEhQdXquy6UJ/OgEvF2n
	LqNm9qQAk8akRnenRdvDKH6IX+p2wQ2GM05WxDuc9VrJ+fWDPwn8ytox/soAGOffjokvcC5FqyG
	CpErW8poATVGeDwPhxMW5zUdQt0yEJrqRlO87ALDZ8q7gg3VxplObf5HiQxJK+
X-Received: by 2002:a05:6102:5112:b0:5f5:4d37:8118 with SMTP id ada2fe7eead31-5feb2e8e9d3mr10009192137.2.1772092224351;
        Wed, 25 Feb 2026 23:50:24 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df645b877sm967359241.8.2026.02.25.23.50.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 23:50:23 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94dd0f3c4b7so345588241.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 23:50:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvYLcLFULEBDAAtdZvus+chZFztULudiIwxZcgfqUc9DRl7cbGM7uiagHHon/lQIAaDmWG6r1T1QE=@vger.kernel.org
X-Received: by 2002:a05:6102:510e:b0:5fd:fa9b:1a2 with SMTP id
 ada2fe7eead31-5feb30d4af4mr10289856137.28.1772092222850; Wed, 25 Feb 2026
 23:50:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZ4_sBIy8rOUL59Q@devuan> <2026022531-tightness-rare-6a14@gregkh> <aZ87Z24f9HZsofGl@devuan>
In-Reply-To: <aZ87Z24f9HZsofGl@devuan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 08:50:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDPPgkWTHPb3Mfhn2cGmv7YPquakEuF6z7zam7gGVW_g@mail.gmail.com>
X-Gm-Features: AaiRm51mZ3TMr9-1T3RZtvPkGB-I32VB6CDd1n0kyHAM014BC7DctANFpncyC8Y
Message-ID: <CAMuHMdVDPPgkWTHPb3Mfhn2cGmv7YPquakEuF6z7zam7gGVW_g@mail.gmail.com>
Subject: Re: [PATCH] Add short author date to Fixes tag
To: Alejandro Colomar <alx@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, kuba@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, "Theodore Ts'o" <tytso@mit.edu>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,goodmis.org,kernel.org,intel.com,red54.com,lwn.net,mit.edu,canonical.com,perches.com,gmail.com,linux-foundation.org,vger.kernel.org,lists.linux.dev,lunn.ch];
	TAGGED_FROM(0.00)[bounces-77183-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.936];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 378CE1A3D08
X-Rspamd-Action: no action

Hi Alejandro,

On Wed, 25 Feb 2026 at 19:20, Alejandro Colomar <alx@kernel.org> wrote:
> The case where it would matter is if you commit a fix for a commit that
> is only in your stable branch.  However, since the stable branches are
> not real branches, but actually a set of patches, I expect you would
> just drop the faulty patch, right?

Stable branches are real branches, cfr.
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/refs/heads.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

