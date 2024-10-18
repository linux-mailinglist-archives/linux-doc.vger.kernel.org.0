Return-Path: <linux-doc+bounces-27990-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FAE9A470F
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 21:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67BAF1C21EFB
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 19:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFED204F8A;
	Fri, 18 Oct 2024 19:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b="l3oO1bZ0"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5373477;
	Fri, 18 Oct 2024 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729280261; cv=none; b=m93PLqokGpiiwF4hPaG+cetBS57dcV+O1Uga/39fJ2fFX3IlrznnDCC5SrO2gxbnFz/4Nn3Y6XztbeZBIZ10ENVh4qIewmo3QJpfT4bxhlEk/jnuRSUlQbTcF8m+gKBGNPwDqkl6oVT2ap2fs5M096hs6qEYHqU3DS8XDSVUbt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729280261; c=relaxed/simple;
	bh=/lrZfts5NbnRQtVSw9VtSm/CdSHLv/6Pba0zDxeHWh0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WXD6GWQgw7l2Ay2ditJCIbsiSqQDCjZ1YAUeU+zea8gYRDYiCcYkK8dzc8NTf6hTTCGbxBlquxGNC9o7fbF2AFr4SGCThg3A+o/afk/yBaMZKBgqENkkOSitJV8om4XssEFeJs0f2c4nyl2Jsopw72O/mMwvpQ5X+TwmT9Nxjhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=krisman.be; spf=pass smtp.mailfrom=krisman.be; dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b=l3oO1bZ0; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=krisman.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krisman.be
Received: by mail.gandi.net (Postfix) with ESMTPSA id 754881C0003;
	Fri, 18 Oct 2024 19:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=gm1;
	t=1729280251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lrZfts5NbnRQtVSw9VtSm/CdSHLv/6Pba0zDxeHWh0=;
	b=l3oO1bZ02YmVeOvsX5Y062C3xzO1MtwuKL2jAy+dAbONORGmFLJmZtzm2yWr2NXSGL9Fzl
	BBnbpMK0KmXgTR+48symI+ey2aM+HD9Tx+p7rv3/XYd71YC18pv3ljpuE4l7jDYNvN0huH
	1pjyYQq3JM8iU8OcgI4WGveJa4pJfRxOBjffBgnrTxG49Ac757WarENNQ+VgONWyPy5GZs
	hToZkjbEeOJ97kX1rA/fxGthgFMOyZQ+CQrfs0UOqxfn0P80uAjCJ17UexrcsCkDwfBhQT
	hWUd4iI8WGACyzZtk3A+nZF3cWMAPPkN9eaTT1rKPqCC2yzJFm2fM8/JH0wOFA==
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,  Christian Brauner
 <brauner@kernel.org>,  Jan Kara <jack@suse.cz>,  Theodore Ts'o
 <tytso@mit.edu>,  Andreas Dilger <adilger.kernel@dilger.ca>,  Hugh Dickins
 <hughd@google.com>,  Andrew Morton <akpm@linux-foundation.org>,  Jonathan
 Corbet <corbet@lwn.net>,  smcv@collabora.com,  kernel-dev@igalia.com,
  linux-fsdevel@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-ext4@vger.kernel.org,  linux-mm@kvack.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 1/9] libfs: Create the helper function
 generic_ci_validate_strict_name()
In-Reply-To: <20241017-tonyk-tmpfs-v7-1-a9c056f8391f@igalia.com>
 (=?utf-8?Q?=22Andr=C3=A9?=
	Almeida"'s message of "Thu, 17 Oct 2024 18:14:11 -0300")
References: <20241017-tonyk-tmpfs-v7-0-a9c056f8391f@igalia.com>
	<20241017-tonyk-tmpfs-v7-1-a9c056f8391f@igalia.com>
Date: Fri, 18 Oct 2024 15:37:25 -0400
Message-ID: <87zfn1yzgq.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gabriel@krisman.be

Andr=C3=A9 Almeida <andrealmeid@igalia.com> writes:

> Create a helper function for filesystems do the checks required for
> casefold directories and strict encoding.
>
> Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>


Reviewed-by: Gabriel Krisman Bertazi <gabriel@krisman.be>


--=20
Gabriel Krisman Bertazi

