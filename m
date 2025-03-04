Return-Path: <linux-doc+bounces-39974-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA741A4EF99
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 22:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C5F1890ECE
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 21:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE4C24EAA8;
	Tue,  4 Mar 2025 21:54:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A1D1DB125;
	Tue,  4 Mar 2025 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741125275; cv=none; b=ZhQQ3i3vRoILHi7TGVdtbC/Jo75T0qxge5wOQKnUNRsph+sqiqLeNFY9KIoPgsS5M8RlxLUJmQdEH5RyUK0oNcHKat1pmbyhSMMKcWifDUeIF0Tr4gVTWNQ3bRWNOzr4i/8wDjZ5w91rxc0Bvqv/Dc3ryhK1UF67+ZxIEvR+aVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741125275; c=relaxed/simple;
	bh=kghXKR47nM0J6vuBBuZW/HBLiIXymNQdBzC7PDP9RVk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4HWUALpK79n60x8ylVABb/gpruRKvKh0GSWm6i4csPos5wGwcPYkJpT9Cd9TpMFESGSxXw8aro1Szwyh+OsDaA2v5fc2vMdSGp6Rm1M0dbInHv3vCDo5H3cKC74sLwAQxzIMc/VyMQXeXhj5OIesov2r63vdhJ8gTiyEGgtcN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64352C4CEE5;
	Tue,  4 Mar 2025 21:54:33 +0000 (UTC)
Date: Tue, 4 Mar 2025 16:55:28 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Shuah <shuah@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 conduct@kernel.org, tab@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] Documentation/CoC: Spell out the TAB role in
 enforcement decisions
Message-ID: <20250304165528.2e9b336c@gandalf.local.home>
In-Reply-To: <2b3aad9e-5288-45d5-bcdd-9dbc4f7298b4@kernel.org>
References: <20250304194813.11049-1-shuah@kernel.org>
	<20250304200947.GF30583@pendragon.ideasonboard.com>
	<2b3aad9e-5288-45d5-bcdd-9dbc4f7298b4@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Mar 2025 14:43:13 -0700
Shuah <shuah@kernel.org> wrote:

> > Without an explanation of the intent, the CoC and TAB would appear more
> > opaque, especially given the tags present on v1 that shows the patch has
> > been discussed behind closed doors.  
> 
> No decisions are made behind the closed doors. As mentioned above, the
> document had inconsistent in when it described the TAB role. This patch
> is fixing the inconsistency.

I guess this should have included a "Fixes" tag and described what it was fixing.

As I was one of the reviewers, I blame myself for not catching that.

-- Steve

> 
> >   
> >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> >> Acked-by: Jonathan Corbet <corbet@lwn.net>
> >> Signed-off-by: Shuah Khan <shuah@kernel.org>
> >> ---

