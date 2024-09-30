Return-Path: <linux-doc+bounces-26012-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497698AB09
	for <lists+linux-doc@lfdr.de>; Mon, 30 Sep 2024 19:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0035E1F21B5B
	for <lists+linux-doc@lfdr.de>; Mon, 30 Sep 2024 17:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE21194096;
	Mon, 30 Sep 2024 17:23:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C55A286A1;
	Mon, 30 Sep 2024 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727716999; cv=none; b=KCh3JJVQeb/oROSzalOCuGfd+bmjtuFVu29/nuRolhdpmegCdhcWrDvsEj0w9UJPMtHjMitT9s6hlwx7DWvt1Dn1DG/Z48O9kOX8YK+nUX8U953Gxv76h4jck31ZAoyaypbKHPSccYrQn9wm47EFfvz5jvMbHgm+h8qxuDHMH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727716999; c=relaxed/simple;
	bh=TPW/8gg94x07AziOpLQsP8y3zZrcj0YHmCWdVDAqAEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqSUWEBGm8cx/V/lQy2azDcGzC5jl9EQRQfu8FNXPfBl5eb72yw1JrkhNs7XFk9IEUWTmvq7wmpjdBdSMg1qcqXiuxeUDeUlGqYhIeZ/I47KxMUonpo+u/NgW7RmMae1ZYZfwcsxd8gAhQ3PUle7XyOIUjmSosNe62bSQ3ZvbqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE503C4CEC7;
	Mon, 30 Sep 2024 17:23:17 +0000 (UTC)
Date: Mon, 30 Sep 2024 13:24:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Hans de Goede <hdegoede@redhat.com>, LKML
 <linux-kernel@vger.kernel.org>, Linux trace kernel
 <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mike Rapoport <mike.rapoport@gmail.com>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/tracing: Mention that
 RESET_ATTACK_MITIGATION can clear memory
Message-ID: <20240930132404.728831a7@gandalf.local.home>
In-Reply-To: <87ikud9hxr.fsf@trenco.lwn.net>
References: <20240926130159.19e6d0e2@rorschach.local.home>
	<f8546c5d-fa2e-416f-8a1b-431025b4df4d@redhat.com>
	<20240930131415.1438c0b7@gandalf.local.home>
	<87ikud9hxr.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Sep 2024 11:20:48 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> > And I forgot to send this to the Documentation maintainers :-p
> >
> > Jon, could you take this? Do you need me to resend, or can you just pull it
> > from lore?  
> 
> I'll grab it in a bit.

No rush.

Thanks!

-- Steve

