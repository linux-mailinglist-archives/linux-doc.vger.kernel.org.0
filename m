Return-Path: <linux-doc+bounces-11484-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690B872698
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 19:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3FA1F292C9
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 18:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5031C28B;
	Tue,  5 Mar 2024 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a7nk0ZbF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408801B970
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709663628; cv=none; b=dzHM6/icBdqqTTs7WO+1pJ+rqVZHt2LYFF4jCENJojs9hMfV1EQkjqcpDKRRG0uzHJC6Xf7eoRYb35S9y51NaNo6LskvLeBQAGkAViFtlKyS+yvradLvvfumBMPz814R3qsA6fyH8Pkw6qU9fr+yQulIcfhxoFL8f7Y8zMM0jyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709663628; c=relaxed/simple;
	bh=owF45A5U8RazsW2KrYptuABA1Q6yhy0RwNPs4QQaAno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAb0ocT4KPHg4vvmmZyMQYNNPzLDUW8+8IDqoPWRc1GKMUlp2n+1JC2bjb74JlZWmZt0bP4Jty6oShlA9PN5p0JChi6xkqu7fEOzsWY+wdfWf+5LY/WkSTsIjhL1QoUokfugck3skz/vpyUYbs6zEb3YbWjBXINhxcZiocBRR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a7nk0ZbF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dc5d0162bcso52012145ad.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709663626; x=1710268426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZoQI1fT8QfmmvEDY9ZYWRkDR8aVhX37TS8JWY66OSk=;
        b=a7nk0ZbFLpOKCFbMBKU0gUAQUc7qq9urOdSEiVF65f8wWNcGnMeIsSpN9MREdmM0n2
         /Z3N2EV6LDzSJPpi2G9bzoCzy4Lh52cfNOBF9OWxAwrtm6GPMPnCNp0jJQegnc/Gf+Ob
         Aq9ed+/5oXavnOlTe8xg0YGd163lqwSdmFxVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709663626; x=1710268426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZoQI1fT8QfmmvEDY9ZYWRkDR8aVhX37TS8JWY66OSk=;
        b=NNHXsB9E8S0g54x7SVqroZrTstrSQki6j72wNBIw+Sf3eykhRjCWo4BYKtcFI4PK2p
         VdJZCDTBm7+yqdpxiZ3Ytu03TDcumnJO5OjwRm2mz44CcYEkpfV0P00QrNQdbNsPSMpa
         l8W5O0LjOpvkmcahii4kg4/cuULArdDxQhqozqctvfTbW4Tlp2d8GQ2z0Jbv6eWnFcUw
         TAz4EJ6O+hZRcfIF4qghZzQDzKN1rsTHYjJzjgmlwJUfXRtPyONh1EH5FWU6JrMt0F7z
         44Rr7evREhtLpPgk90zzo0D60bYkekun+dOh6ghgSi5SaoKwfCVd3FrjQfJB5ID/g1DM
         Q1jg==
X-Forwarded-Encrypted: i=1; AJvYcCWy3ANHtd+UQjVYOX8aaFJC0BqmcEJ+lHv5uKr/vZShWqJyYzl4TPcupKsXOQv9osoJmyhLBKLA1malg0SxRJiDLMa61JRmzR1H
X-Gm-Message-State: AOJu0YwrfL38IPjYo1PFhHgqMi24oU1IfP7VLT1/2mq9kXZDhmxqClNF
	tAN/x/2FQhq/gCWorng4+lloDoesrn9U8A76Kzqa+9tj5Q6ImX/hW40g8/p46g==
X-Google-Smtp-Source: AGHT+IFWgP1XMzzTAo9S4FmzwND5LVJWMFuSfybGA+o5U5mxtPKyFuUMpJm5Tbtd0lqsISkQUgsviA==
X-Received: by 2002:a17:902:a98c:b0:1db:cb13:10f1 with SMTP id bh12-20020a170902a98c00b001dbcb1310f1mr2522864plb.19.1709663626654;
        Tue, 05 Mar 2024 10:33:46 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i3-20020a170902c94300b001dc95205b56sm10890809pla.53.2024.03.05.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 10:33:46 -0800 (PST)
Date: Tue, 5 Mar 2024 10:33:45 -0800
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Matthew Denton <mpdenton@chromium.org>,
	Adrian Ratiu <adrian.ratiu@collabora.com>,
	linux-fsdevel@vger.kernel.org, kernel@collabora.com,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
	Doug Anderson <dianders@chromium.org>, Jann Horn <jannh@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mike Frysinger <vapier@chromium.org>
Subject: Re: [PATCH v2] proc: allow restricting /proc/pid/mem writes
Message-ID: <202403051032.783210E95@keescook>
References: <20240301213442.198443-1-adrian.ratiu@collabora.com>
 <20240304-zugute-abtragen-d499556390b3@brauner>
 <202403040943.9545EBE5@keescook>
 <20240305-attentat-robust-b0da8137b7df@brauner>
 <202403050134.784D787337@keescook>
 <20240305-kontakt-ticken-77fc8f02be1d@brauner>
 <20240305-gremien-faucht-29973b61fb57@brauner>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-gremien-faucht-29973b61fb57@brauner>

On Tue, Mar 05, 2024 at 12:03:21PM +0100, Christian Brauner wrote:
> What btw, is the Linux sandbox on Chromium doing? Did they finally move
> away from SECCOMP_RET_TRAP to SECCOMP_RET_USER_NOTIF? I see:
> 
> https://issues.chromium.org/issues/40145101
> 
> What ever became of this?

I'm not entirely sure. I don't think it's been a priority lately
(obviously).

-- 
Kees Cook

