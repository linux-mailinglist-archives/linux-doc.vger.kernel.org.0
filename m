Return-Path: <linux-doc+bounces-13587-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94E289A921
	for <lists+linux-doc@lfdr.de>; Sat,  6 Apr 2024 07:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA9201C21224
	for <lists+linux-doc@lfdr.de>; Sat,  6 Apr 2024 05:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5813C1EA6E;
	Sat,  6 Apr 2024 05:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KFt4n9CV"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C951CD13
	for <linux-doc@vger.kernel.org>; Sat,  6 Apr 2024 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712381134; cv=none; b=XVw7mklGIAJYf2ctl5DJ5YvNiD/z8dONoiXUn5BhcviMuFpklA8hDvijghxYU6Yp01AVs6Fb/S5AbwXMqs4m3u1yRhNtU67RynbCZRAJ8vNtQe4jRplW3FSg/kmpqa5PMWntyPDdsaMpQBfMU5J9oXg8zyeE6CnrRb/9/WdDSx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712381134; c=relaxed/simple;
	bh=GBJ/4qcyi3hIK6KdFPiWuGa9/vsZlY1k4eIqxJceVYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFAH407Z7kxqgOhkgXy8McUuDhFO+GQJK9jJUkeFW/xPSmWqI1lgDKgLAAa5S14vDTiBje1DyHP934YtAIrgOyW9fY+vMcabpFyyYDDLAHPPGpprPffObz3b63Vl5/Elp6a/qXQE2attMEqHGuGtsqd12IS/S/e9fHAOwIf5o2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KFt4n9CV; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 6 Apr 2024 01:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712381131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0s8OKyEtBCTwct3IXJh6ls/NerCr/sOkNHMDUlOY/0=;
	b=KFt4n9CViXD9Lsjtq3gepymSsaeClFuhykWaf7PDCD9iY8hs+/ApOLJ1GdO6ucw5/VMjUp
	zMAuz1umDjT9Bcvl4kZ3tA6RNxPFtbYERb1QIswrs6lXA9IiFMZ19DqxiachfQ6F9Hn/p0
	wziY0IxFK5cDlUVy6FLQ/xBfNe07dCc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux bcachefs <linux-bcachefs@vger.kernel.org>, 
	Brian Foster <bfoster@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Darrick J. Wong" <djwong@kernel.org>, Chandan Babu R <chandanbabu@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/2] toctree fix for bcachefs docs
Message-ID: <lkexpg6uihcokigp3iy7dmqchxjc7nsyaf6fe3nirizzsxpka7@eseglantc7iz>
References: <20240405072320.23416-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405072320.23416-1-bagasdotme@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Apr 05, 2024 at 02:23:17PM +0700, Bagas Sanjaya wrote:
> Hi Kent,
> 
> Building htmldocs for current Linus's tree triggers a new warning, and
> that is on your docs (missing toctree). Here's the fix + MAINTAINERS
> entry for bcachefs docs.

Thanks! Applied.

