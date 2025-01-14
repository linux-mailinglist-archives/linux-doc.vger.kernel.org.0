Return-Path: <linux-doc+bounces-35233-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48640A10BB6
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 17:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFB327A18AE
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 16:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C70F1553B7;
	Tue, 14 Jan 2025 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IkOueaJi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4B232451;
	Tue, 14 Jan 2025 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870642; cv=none; b=qOdbpnD95n9TmX4ZTFioGgWFXgfscIxF6jhJVp25P7cJDWcFMjMjOFKX/reIzmYPMmESfFyMDW+1dTW606+dlj20FPWCBP/aph4FB3OBIaYVrsqa/07w8fBNBtIHnKT/kGGKLwxooYUnpKUm8CkQZu9pz6pfjCyHZwtjMUNUXEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870642; c=relaxed/simple;
	bh=O+t9PcqT2naOzujvaOcuFnOmDy7Fa4ewetoVu7oiPE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxEx0zx8wkS1kbs3stj1SjcfCFd9CsQFPb9koPRKAX5I4jusizzrK/U5nJVTwU2xD6ImRiuuPg/2931z5TpUWt99ixHxUBeVWy4z9oMVlUN33JKodSOQPIAYrKkUR8o2RA+6A5n/HMnOcMRazYMBOc37Vx/vbOkqfT75zgfOIEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IkOueaJi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D36C4CEDD;
	Tue, 14 Jan 2025 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736870641;
	bh=O+t9PcqT2naOzujvaOcuFnOmDy7Fa4ewetoVu7oiPE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkOueaJif0kDclqLaSg5YJagy1rZKO8T3hIFnBzenRMW+KhLFU0cfasUiSn8WzMkP
	 bs+euSyKE4lQV27doZHe4oZpO243N/Hr3Plm4X2CIEtcptSMbh99Fr63d2gl/GkHoy
	 FOyPzpPnenmaYcWuVF413P3iDkmXy1AzrcvhRl/c=
Date: Tue, 14 Jan 2025 11:04:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch
 footer
Message-ID: <20250114-tapir-of-splendid-leadership-ad115e@lemur>
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com>
 <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
 <CA+i-1C1WF1cSvcNABGRbg34_aaOnSoVoDNBR357q8rrGk52OPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+i-1C1WF1cSvcNABGRbg34_aaOnSoVoDNBR357q8rrGk52OPQ@mail.gmail.com>

On Tue, Jan 14, 2025 at 03:25:41PM +0100, Brendan Jackman wrote:
> <konstantin@linuxfoundation.org> wrote:
> > Do we really want this to become part of the permanent commit message? I'm
> > pretty sure this won't go over well with many.
> 
> Why not?

Tweaks aimed at checkpatch are only useful during the code review stage, so
once that code is accepted upstream, they become wholly irrelevant. A
checkpatch trailer in the permanent commit record serves no purpose, not even
a historical one.

At best, utility trailers like that need to go into the basement of the patch,
not into the commit message.

-K

