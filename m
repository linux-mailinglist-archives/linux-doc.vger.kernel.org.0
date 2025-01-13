Return-Path: <linux-doc+bounces-35110-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0646A0C171
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 20:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BED53A5F02
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 19:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBE11C5F23;
	Mon, 13 Jan 2025 19:31:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECBA1C2324;
	Mon, 13 Jan 2025 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736796701; cv=none; b=ERZ0UufBQ1OrfdMn+YcZRBSbk0VweqNrLgN6Yc/cjt2su/K85WeWJglBqkeYUlz/sX4wX2ld9bRfXUBDIo2jZgwW3BGRiUcZJIrO17uP6D1HMm8N/33X9MQ2ys0BttKyN9huS3roVE/kllxhQdKrAIHG1P1O9ZvVXNcflPt+iV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736796701; c=relaxed/simple;
	bh=2Enc4FtlvrYu9dd22AM1/QjKiu1FDRzVIJv6XU/DUh0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T20nwUosYPKdOeJC4LachHbe7tyKrtXuKjB+y9k34Cd/2eSmss5Ii/pgNDTQvqRh17mwydn3QYpV4mZKh9TNAdk+bbLWHPlyOw10jbDh/d4VTaaz1DgUSzlU5jlC7BNdN35EYt2oCjNK4lVNbnhzV3l83pOhQIkfycDTKDvYlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id DDC4816027F;
	Mon, 13 Jan 2025 19:15:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 8347320011;
	Mon, 13 Jan 2025 19:15:05 +0000 (UTC)
Message-ID: <a1071d5d3dbfaa0e9e54b359d7b889d84d063804.camel@perches.com>
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch
 footer
From: Joe Perches <joe@perches.com>
To: Brendan Jackman <jackmanb@google.com>, Andy Whitcroft
 <apw@canonical.com>,  Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet	 <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Mon, 13 Jan 2025 11:15:04 -0800
In-Reply-To: <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com>
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
	 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8347320011
X-Rspamd-Server: rspamout01
X-Stat-Signature: zpo89xy57w8yut5mbwbgsq95rqy837sr
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1//o6dTscF80we7PZOpO7Qu7Bx4hCV7Rm4=
X-HE-Tag: 1736795705-571437
X-HE-Meta: U2FsdGVkX19aP5NcJEVTKkIveRSWOIKotubsvM5hfYyTCDeTN0VN1cdPGuyvpSoaXMxrIHTYic9CLn71IV+XCdED5rrmIQOVe81a0Ui4Xij7IIoLt4tTyJMia7M6pvNGw9VEhMfTcnaaLwTkhM56tGZ5GdD5LUwEfG+Tk7mnxESy4k1sRE0Oe06bEj8aevs78hVKXkjSyQeqpiWV0Z61J+Y+EoSo5XEaAk9wfosCCBqtMO/W1NexgSrVagOtRNPyU4kMia4tN+KRbSJfTbmpUFpt9YHvGzT4xzW1BcWzN8PNhwExKfrxGeep6HLkjjwr

On Mon, 2025-01-13 at 16:04 +0000, Brendan Jackman wrote:
> Checkpatch sometimes has false positives. This makes it less useful for
> automatic usage: tools like b4 [0] can run checkpatch on all of your
> patches and give you a quick overview. When iterating on a branch, it's
> tiresome to manually re-check that any errors are known false positives.

If you do this, and perhaps it's not particularly necessary at all,
I suggest using something like the message-id or branch name for an
ignored types file and have the script auto-write the found types
into that file.


