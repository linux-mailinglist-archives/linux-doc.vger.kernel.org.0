Return-Path: <linux-doc+bounces-62899-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C01BCB722
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 04:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098D91A64359
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 02:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5592472AE;
	Fri, 10 Oct 2025 02:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elQ/QoLE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F019C542
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 02:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760064527; cv=none; b=SMJnWgmk5sGjXNusswCrlra/JBBi3aW+qw3tU4oGql1pJQvielVsANvgHRLjQF7xx09LLnilBXwbC6vLFsfa64KUbXbKjwspiP23WpbaG9v++fCj0Mqcm90EI0zxE5ApCe9+PsUIJYXdUONBA90vfrzGyDfzbN40jhqerSNwEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760064527; c=relaxed/simple;
	bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1NdutBP80nBv+hXo/214Q8J4H2MAn8R7/4NECrTsHfMnixHaYtzn7TBfcRPatf1oH1nMVevoWJReuS7plBWgkYVm/0Pv/VcdS5VkMToXafCrxP243/luBayTfox51C94Bn1dQ8lciI7TlRLqDNbLwhi82mQTVyFZXSia/jMuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elQ/QoLE; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-743ba48eb71so34881207b3.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760064523; x=1760669323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=elQ/QoLEl07oguGQwVeaLuPvx9pg+ZF3HObzItQAr16R2PwjJJ/BJhHlsBagHWRo1E
         q4f4I5TainPicRHfP4mxi/QA8fweTGrjQlrXERSkdlr6KgU4ZilfiRp9i5MkNzxdmJFE
         GqtJBFbDrYJM4r8+ph0NGbgZ2YQn4dQX2PL+zpJpSkH6dn2eia2X9CYfK8q38r3RGNos
         FYWwKOjsxbNPoX+OU5D0/LZM5lIAyQ56jv8iMtnZPsc8rn7rN4UBS2EkrASRagSQ6iHh
         M0HiA7o+kBUytakpqhUfCayQ9hhTHxglANqJie8IdxhcFjjr6XDM3XOMyO0pRXWHPZL7
         uJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064523; x=1760669323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=stcF8TojKodo0zoh7wdWUWC/5+I+LNMKEP0nkKYu6eCxC7Ou2Dly+S3+kepJKIDv/A
         1Z13ErsBz2GakhYih+GyVBxVCbXxb3cyk6EnI2/peiciU2eYfx1BOLEJXWULsyRm4G71
         b9xx+56hXmfrGc+k9yev/XTFNjOrvp4eMelpbEYgY4nAMBk7QqLSR38qSTSRUgcQUz00
         dJ7tz+POBJJT8ThFZR9RT9jj8tTGMpAL33ayiKBa0/3sZS+ecBB2KA77IkisoGTNFb8R
         h/3k5QHe+hTdgU8swMPDwk/S1F4Fzix2FUvkBD+iM8MdLBVKxgw8kPdV5Kb29ciAMHeW
         1b2g==
X-Forwarded-Encrypted: i=1; AJvYcCUIr8vsVgVPSDbL32a/64uixAUbk2arCsj7tnj1bWJdNyA+Ptw9cGI1y75e+me8AMocBEpUTPa0jCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzavMmSGLtGy9l8Fa7eY9lnPxY2GspDq1HBM7YW7eLZ9rrrxcse
	ga+PD8vkuFsqLNIflvAbGdyO5AeijnxUZ7wGrPQum2Tlppx7QluryvXWOYWrPMicJ6PRCkp88JY
	h53g6sZBZTeGj4g3U6pWB0le2jUnKC6M=
X-Gm-Gg: ASbGncui/1FselfGRFmkmxhl9lcVWkuvDbz/sjcT1ftzrKxMQlA6T5OTZKzNdQgUnRi
	X/xbS2e5h7vnyqcQ8w168lE28IvAfLENo+nmZlce+96fbqqJLB18e0Gq2eNSyzUv5x3ZrveBJJX
	2eu0n/4hGFWgkm6Yh58ONbE4IB8cW2UWP2DzNC+1oSfy+nrYjrUyoOeLgq0PnhqPdBmdbhTnXVl
	4a4NUtk8H3qTuqNtA0gB/orbDqVcpfo/DehkgKq5Q==
X-Google-Smtp-Source: AGHT+IE/ruZR0Nl+gZjd7KSfaZ+4Yt5azf8Eoz6teA2EZ5XcCIQ6BBXF8AxOCZshaSTrV+l7WDzDAJYCcqNIJ+IMELc=
X-Received: by 2002:a53:cd0e:0:b0:635:4ed0:571e with SMTP id
 956f58d0204a3-63ccc4fd4b5mr7697871d50.22.1760064522649; Thu, 09 Oct 2025
 19:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-22-safinaskar@gmail.com>
 <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 05:48:06 +0300
X-Gm-Features: AS18NWC-iakvkxLfUlO1LRxakg0fg4KV7Trw_hsIF2wxGpnmpWZvHTCQ7Z3GaoE
Message-ID: <CAPnZJGDK08eDWaMTmvVQwkAAThUvgB0XgAapqqV4_ZmWeay-iw@mail.gmail.com>
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of root=/dev/ram*
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 14, 2025 at 1:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Please wrap commit message according to Linux coding style / submission
I will do this for v2

> To me your patchset is way too big bomb, too difficult to review. You
v2 will be small.

--
Askar Safin

