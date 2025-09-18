Return-Path: <linux-doc+bounces-58625-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F2B41C5E
	for <lists+linux-doc@lfdr.de>; Wed,  3 Sep 2025 12:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED6C03A6AFF
	for <lists+linux-doc@lfdr.de>; Wed,  3 Sep 2025 10:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AC92F39A4;
	Wed,  3 Sep 2025 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ReawGCfP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lGL7uF8M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ReawGCfP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lGL7uF8M"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB3F2F291A
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896748; cv=none; b=q2+njQoAD6JmmFp3uQMJsihsqJG15WZtNqZGB227P8zyJmBEzJeK21V0lNG8Hco4p/sf39BYs9b2pAMy0eK+rraH35ANi4bhtNYc8bn+8aWx1LTTY5Mcl3f3UWrv1WGd/QgeMNaTOf+IfJJUd2fRBJ/gaYNwjS8cgXGPOLpPbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896748; c=relaxed/simple;
	bh=nO9g3PNXhwTLKuaA2Jm4zlIfcuIINjcXTwiFdT85LUY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhGug+MGCBK8pvkdWKdIlf02UK7zADnrbaI67ajwsO5qfh3fTfyQ5Fcj/xwtxT+nf4SAE0Y4TBgNWI83ehhr+Sl1ahOHFi573YXRhNpRslqNC5K55WoO09odVkmLOIRbeMj2QDyRKAi+NAOGBb/XXe/y7SflzFQuoGYg77hkzQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ReawGCfP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lGL7uF8M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ReawGCfP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lGL7uF8M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 82F0F1F456;
	Wed,  3 Sep 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756896745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SnMOUYeZoFXkfeNuRCqWig5KNvw7Qlwif546rjx2fGc=;
	b=ReawGCfPiV9LEelH6cW6IkvDBRd8ncVPj3hLP2aO1u2rxIE5yRcHLh5c5kbL08+7bCZEQC
	8uK1etXrJI7El9u63QgMUg++UwG/r2zbQMR+D3ZIoc4q8yFLWXTmlTrrFGLJec5oVdODfT
	giY3j3gLj+y3aTcGP2o1Bda7N1EJgo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756896745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SnMOUYeZoFXkfeNuRCqWig5KNvw7Qlwif546rjx2fGc=;
	b=lGL7uF8MNkBZ+XZo4oyF5Q8wc0LR4m3KBs6sVEUD72IeaRJKwahPsddmonJJSjH8CanV86
	TzfsbGrprk48tyDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756896745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SnMOUYeZoFXkfeNuRCqWig5KNvw7Qlwif546rjx2fGc=;
	b=ReawGCfPiV9LEelH6cW6IkvDBRd8ncVPj3hLP2aO1u2rxIE5yRcHLh5c5kbL08+7bCZEQC
	8uK1etXrJI7El9u63QgMUg++UwG/r2zbQMR+D3ZIoc4q8yFLWXTmlTrrFGLJec5oVdODfT
	giY3j3gLj+y3aTcGP2o1Bda7N1EJgo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756896745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SnMOUYeZoFXkfeNuRCqWig5KNvw7Qlwif546rjx2fGc=;
	b=lGL7uF8MNkBZ+XZo4oyF5Q8wc0LR4m3KBs6sVEUD72IeaRJKwahPsddmonJJSjH8CanV86
	TzfsbGrprk48tyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44A5A13888;
	Wed,  3 Sep 2025 10:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BEyMD+kduGgSDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Sep 2025 10:52:25 +0000
Date: Wed, 03 Sep 2025 12:52:24 +0200
Message-ID: <87qzwnvmdz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: docs: Remove 3rd person singular s in *to indicate*
In-Reply-To: <20250903100842.267194-1-pmenzel@molgen.mpg.de>
References: <20250903100842.267194-1-pmenzel@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 03 Sep 2025 12:08:41 +0200,
Paul Menzel wrote:
> 
> Fixes: 78811dd56def ("ALSA: docs: Add documents for recently changes in snd-usb-audio")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied now.  Thanks.


Takashi

