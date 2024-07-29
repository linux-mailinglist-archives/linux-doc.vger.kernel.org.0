Return-Path: <linux-doc+bounces-21509-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF59E93EFF0
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jul 2024 10:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62625B218D4
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jul 2024 08:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0505113C3C2;
	Mon, 29 Jul 2024 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z0Rl5GUh"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A6213A405
	for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722241940; cv=none; b=omfHc/eaRBjlkQuuuYUJ2KSffuAeqJ/UjKXw1V2tpZ0LzgAlXmIOpvOYCNjh+78/U0iOBlSX6cPb0+j1EfRHJbiopNMJolqRVy3jM9rhZRBBZH2LYv+opnLmBgdpw1hubTsJvZRRwJbXg52J5mPhvseMsER+u7CehgESj4u2iOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722241940; c=relaxed/simple;
	bh=RKu9KPP9FD54kybo0dRLPGyKHnBnvcdwR4F+6veHEvg=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=BC9O8DP+R43l5rWltVQ3KugTV4z9zQG1zJnM1K9sHMm1ch2D9BiyS+ZqY5MNIAufRk5WMRwBC6uxmUSytey1JadpHo8MwI9OsVs9DfuVQW0W8i8K/XsuHYO99XGNMAY6RZ6pXpncu83IDSG/05rVrrLhL1GwyjOlcFye5gyUelM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z0Rl5GUh; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722241935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKu9KPP9FD54kybo0dRLPGyKHnBnvcdwR4F+6veHEvg=;
	b=Z0Rl5GUheiAHWpBvSRXhn2yjWU6Xf1UXMa492QCi/ySK5aqmkdWKTAlSa7CsT7g1xV9n55
	L4wRf/inDXFRdH7FF08Y1gCL/WyQEKXWAu0RQ5B5H0lr55I7FhDl+W85/nB2VVCT+L9kNu
	Q+YfDdHgEwRjGngpqfgqS2KRbIyHdvE=
Date: Mon, 29 Jul 2024 08:32:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: si.yanteng@linux.dev
Message-ID: <ce5a146b8a1857fda90bce79934ae5f9ec2bfee9@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v3] docs/zh_CN: Add dev-tools/kcsan Chinese translation
To: "Haoyang Liu" <tttturtleruss@hust.edu.cn>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <siyanteng@loongson.cn>, "Jonathan Corbet" <corbet@lwn.net>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, "Haoyang Liu"
 <tttturtleruss@hust.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20240727150844.6502-1-tttturtleruss@hust.edu.cn>
References: <20240727150844.6502-1-tttturtleruss@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT

2024=E5=B9=B47=E6=9C=8827=E6=97=A5 23:08, "Haoyang Liu" <tttturtleruss@hu=
st.edu.cn> =E5=86=99=E5=88=B0:


Hi Haoyang,

>=20
>=20Translate dev-tools/kcsan commit 31f605a308e6
>=20
>=20("kcsan, compiler_types: Introduce __data_racy type qualifier")
>=20
>=20into Chinese and add it in dev-tools/zh_CN/index.rst
>=20
>=20Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
>=20
>=20---
>=20
>=20v2 -> v3: Revised some sentences based on reviewer's suggestions and =
updated the KTSAN url.
Our comments need a clear response, and I have noticed
that Alex has already commented on v3, so before sending
v4, you need to reply to each of his comments one by one.

BTW:
Because you have already sent v3, you don't need to reply to v2 anymore.


Thanks,
Yanteng

