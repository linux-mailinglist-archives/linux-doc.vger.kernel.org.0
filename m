Return-Path: <linux-doc+bounces-41928-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4BA75CC1
	for <lists+linux-doc@lfdr.de>; Sun, 30 Mar 2025 23:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0EE918893AD
	for <lists+linux-doc@lfdr.de>; Sun, 30 Mar 2025 21:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27791CEEBE;
	Sun, 30 Mar 2025 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="kRKQFb21"
X-Original-To: linux-doc@vger.kernel.org
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D453158DD8
	for <linux-doc@vger.kernel.org>; Sun, 30 Mar 2025 21:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743371065; cv=none; b=Odn2pOfdYohGQNJbdBmCVmeemBJ8WPzFchOTsZQwG/aSj+9EpO8m6HVL+C+InRIECVT/jOnz5/jtpCyzSO+QcHWKav7cIgi3NgmNpDmu96/vZFIZZcz5HN38M31yZavp0JzQ9/Aatf1Mi/iaV2hb2O7vL87fBVd5ED8kU/zpN1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743371065; c=relaxed/simple;
	bh=SZ6WRaoKVkfmmIq4r41yeU5/s/TtN+62I9qEnm7DKrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URma6gGEfCsUmACgEbE+VzYcP+EVOS6U910eW3qJzLhryucl0QDhSp5RcsQBCErt3cJ9ATnCNQq/eSYMcTXTRr1wHvfJFs5ou0KC/pNZAFWq1Whj8M3h2drEA4uRZtQyNkfetmws4ADED6d3SI4DbBQbdVlfTHFazxeO86fyZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=kRKQFb21; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 450C914C2D3;
	Sun, 30 Mar 2025 23:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1743371056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S2NWD18Pi/XKnjjTW8jfkZcyjgPN2ddq2BTc6Ta4RCE=;
	b=kRKQFb21S7QTa7w8BolvG8xCXxyLOOVtytGyv5PAEq7BzDOC5hzagVLfFuJRBlHsvxf+tu
	2lazdu5/4oJ4VVONzc227FBVeA9VC5vjnHWQycJ4KSp3kJLffCxWcIeP43mpQVDsOW44Mr
	0dq39AUCNd0Y7aAQQJCOalD0mk9YqddoGulCLkVeOgHf9e/oyXYGc980egCA4lGIZxn5z3
	E89FROQTIQjaLWDuN1QH3FrXKbfWp8c4zNGZ4bZL75XBQZIHwHCyD9mme6HRRc1sqrpwdT
	33aJ2dBagTIn0flIuWIPEomsSfydDW+kzg36kmCxuKvW/UEsyy5t2TBXcA9ezA==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 60706726;
	Sun, 30 Mar 2025 21:44:12 +0000 (UTC)
Date: Mon, 31 Mar 2025 06:43:57 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Tingmao Wang <m@maowtm.org>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: fs/9p: Add missing "not" in cache documentation
Message-ID: <Z-m7HbVW9m4x1Zp8@codewreck.org>
References: <20250330213443.98434-1-m@maowtm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330213443.98434-1-m@maowtm.org>

Tingmao Wang wrote on Sun, Mar 30, 2025 at 10:34:42PM +0100:
> A quick fix for what I assume is a typo.

Indeed looks like a typo, thank you!

Picked this up, I'm getting a PR ready to linux so will send this in the
next couple of days
-- 
Dominique

