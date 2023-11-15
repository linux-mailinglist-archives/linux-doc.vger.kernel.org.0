Return-Path: <linux-doc+bounces-2437-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0F7ECA1A
	for <lists+linux-doc@lfdr.de>; Wed, 15 Nov 2023 18:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FAAA1C20BA0
	for <lists+linux-doc@lfdr.de>; Wed, 15 Nov 2023 17:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F853DB9C;
	Wed, 15 Nov 2023 17:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AF3Qle88"
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42385D41;
	Wed, 15 Nov 2023 09:56:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD9D18D;
	Wed, 15 Nov 2023 18:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700070961;
	bh=B84mM6617p9zO8gKPZeo7FnDkXTNNw/3Ui+JuYQYZ44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF3Qle88iQHXmtPhaiheiGfq+kLIMg2g6lVW7W61hL/Ss5snExp5kG1/qTbhnCX0g
	 YRLFSFGnxkY+3v61QW+LsS1xYQo+aC0VgODIplApSmUGvCZI02jlCYYt8+rtc+6fYc
	 XUvC/MbS8nhpctMsrymMZ+hsrxI2YngSU1SaDhvM=
Date: Wed, 15 Nov 2023 19:56:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kees Cook <keescook@chromium.org>
Cc: Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: improve the base commit
 explanation
Message-ID: <20231115175632.GA29486@pendragon.ideasonboard.com>
References: <20231115170330.16626-1-bp@alien8.de>
 <202311150948.F6E39AD@keescook>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202311150948.F6E39AD@keescook>

On Wed, Nov 15, 2023 at 09:49:31AM -0800, Kees Cook wrote:
> On Wed, Nov 15, 2023 at 06:03:30PM +0100, Borislav Petkov wrote:
> > From: "Borislav Petkov (AMD)" <bp@alien8.de>
> > 
> > After receiving a second patchset this week without knowing which tree
> > it applies on and trying to apply it on the obvious ones and failing,
> > make sure the base tree information which needs to be supplied in the
> > 0th message of the patchset is spelled out more explicitly.
> > 
> > Also, make the formulations stronger as this really is a requirement and
> > not only a useful thing anymore.
> > 
> > Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> 
> Yup, I wonder if making "--base=auto" a default in git might be a good
> idea too?

When the base of a series is in Linus' tree, or in the corresponding
subsystem maintainer's tree, things are easy, but there are many
situations where the base is a merge of multiple branches (perhaps a
for-next and a fixes branch for instance), or where prerequisites have
been applied manually for one reason or another. This can and should of
course be described in the cover letter, and the submitter should push
and provide a link to a branch that contains the series on top of the
appropriate base (or just a link to the base). This won't help the bots
much though, if they just look at the base tag. Is there a way, or can
we standardize on a way, to indicate where the base can be found ?

> Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Regards,

Laurent Pinchart

