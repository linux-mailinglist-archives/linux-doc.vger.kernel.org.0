Return-Path: <linux-doc+bounces-30477-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C029C4667
	for <lists+linux-doc@lfdr.de>; Mon, 11 Nov 2024 21:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB2B3B21BD8
	for <lists+linux-doc@lfdr.de>; Mon, 11 Nov 2024 20:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B81F1AD5D8;
	Mon, 11 Nov 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="eULhFvzt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF9156C72
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731355656; cv=none; b=k3b8pJrsz2LbMwuS3IK42rzso7NPtRikNSsjGFfYzfwLdbsF+V8hb5T8W6j/boPh34qIXVAcolNkkQs2WkqiMZlmKN/oDGEkaNNp1epOV3lNmlak3yl2sdxvQQEcbLJcjg7vXw65yC1egrI8ssS55WkfE1Yd8Lj191rG19P+wr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731355656; c=relaxed/simple;
	bh=nloYtyyyY7jDqjdQx/OCWTxNKzkTw3BEJn06frFfVP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVy1V5oMmF6NOL1dr4iu92eEn5gnYU/ljdwe+HLR+1Qo3f/VxUFoy1hx0B8bkvDHAVYuqG1/2MzHtg4Hu3s7pGpCqkG33KLXffDVHUPb0BLNT9Alwjbj4S+U3QrgevtPTmv07HoXXRS0caA79f+0WAHOtWUK/EY5Bl5ym+BYnJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=eULhFvzt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-381ee2e10dfso2760038f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 12:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1731355652; x=1731960452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIIKZQ88bUAJO/72aCrm40fHZEJ1K+otj2uYdeOXD1c=;
        b=eULhFvztVYoPnlCH2Jl/7O0x+1k9XedxGk2dt27A02XD4GkFSBvg1gg/OR0b9I2qbc
         FWL/1i/qjjv4E4JAne4zZoY8YREE6NOQez65k35iTXwA9UdBm2u4rwq0jLl1xGfAT57e
         iEJzmOd2aMWsXi9w4oPcD6fcsD1r5tJYfRhtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731355652; x=1731960452;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIIKZQ88bUAJO/72aCrm40fHZEJ1K+otj2uYdeOXD1c=;
        b=PU59ln/XcZnykbadeh5qgT6+cupuezpkpiNCHfbDkFnb1xKCTKtmrhJlFLvtMih/Zh
         DFpQEGBXT74qp7zo9Tb9nIHlHxa78KG3/BAHvf989GqD0TQza3f+gqevnhcAlKlHCv55
         zR/CPhHG4UrjWSx1NZflDZCsWtNaIYv34QcaCcm1KvSmmXjHX0hNhkgba4oxCqO63knN
         pVINVOx9q1xB3Rmc1RGeJHQP77qJFsFn5PfxMup/z7PK2j3BcA3O+s0sfBtIQPS69Csd
         39RsF5nwD+zsO3JPkjTUiXf1XTRIGIwUGcBPSgHUaaWyNYQ6taGZQ0h14qxyKRyel1yZ
         wMSg==
X-Forwarded-Encrypted: i=1; AJvYcCXyWAi709wkgIgrNg2BkGYOZr3IRUKbRnGhU4/iruGNjZTPPpIQS1Jjgnp2E9OE+xHeiaNWH2MXtvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtV7Cnf4z3j949kxc1h0ZL9Uv/S+B9qbspStfALEN5eNToMdT
	vqMJnaiGul0X+rZ+M0X4aKg2r4CovxYWEQKaF1x0cgtjBcwlryk7jz60DCgt1WWH98EW7kTyBCD
	w/vQ=
X-Google-Smtp-Source: AGHT+IGmEyPx4cRoIIS5T3WK6yz/WPGsLjicH5l8YqImtQtFJq8OsUj0ZfrEZw+hmKFHtESQBiAbGQ==
X-Received: by 2002:a5d:47ac:0:b0:37d:5134:fe1 with SMTP id ffacd0b85a97d-381f1866a6fmr11691276f8f.17.1731355651582;
        Mon, 11 Nov 2024 12:07:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm13558728f8f.10.2024.11.11.12.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:07:31 -0800 (PST)
Date: Mon, 11 Nov 2024 21:07:28 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Airlie <airlied@gmail.com>,
	DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
Message-ID: <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
Mail-Followup-To: Shuah Khan <skhan@linuxfoundation.org>,
	gregkh@linuxfoundation.org, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Airlie <airlied@gmail.com>,
	DRI Development <dri-devel@lists.freedesktop.org>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108161853.12325-1-skhan@linuxfoundation.org>
X-Operating-System: Linux phenom 6.10.6-amd64

On Fri, Nov 08, 2024 at 09:18:53AM -0700, Shuah Khan wrote:
> The Code of Conduct committee's goal first and foremost is to bring about
> change to ensure our community continues to foster respectful discussions.
> 
> In the interest of transparency, the CoC enforcement policy is formalized
> for unacceptable behaviors.
> 
> Update the Code of Conduct Interpretation document with the enforcement
> information.
> 
> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Jonathan Corbet <corbet@lwn.net>
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

I think it's really good to document these details. The freedesktop coc
team is going through the same process, we've also done a talk at XDC
about all these changes, and I think this helps a lot in transparency and
accountability in practice. With that, some thoughts below.

> ---
>  .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
> index 66b07f14714c..21dd1cd871d2 100644
> --- a/Documentation/process/code-of-conduct-interpretation.rst
> +++ b/Documentation/process/code-of-conduct-interpretation.rst
> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
>  Because how we interpret and enforce the Code of Conduct will evolve over
>  time, this document will be updated when necessary to reflect any
>  changes.
> +
> +Enforcement for Unacceptable Behavior Code of Conduct Violations
> +----------------------------------------------------------------
> +
> +The Code of Conduct committee works to ensure that our community continues
> +to be inclusive and fosters diverse discussions and viewpoints, and works
> +to improve those characteristics over time. The Code of Conduct committee
> +takes measures to restore productive and respectful collaboration when an
> +unacceptable behavior has negatively impacted that relationship.
> +
> +Seek public apology for the violation
> +*************************************
> +
> +The Code of Conduct Committee publicly calls out the behavior in the
> +setting in which the violation has taken place, seeking public apology
> +for the violation.
> +
> +A public apology for the violation is the first step towards rebuilding
> +the trust. Trust is essential for the continued success and health of the
> +community which operates on trust and respect.

Personal take, but I think a forced public apology as the primary or at
least initial coc enforcement approach is one of the worst.

First, a ban or temporary suspension seems too mechanical and not in
proportion with the offence of failing to apologize. In my enforcement
thus far as maintainer and now also freedesktop.org CoC member we only use
punishment if behavior has failed to change _and_ we need to protect the
community from further harm. Usually it takes years to get to that point,
unless in extremely severe cases (like public harrassment campaigns) or
when the person stated that they refuse to even consider changing behavior
at all.

Public means you're amping up the stakes and massively increase the odds
of people being afraid of their reputation and losing face. In my
experience people are a lot more reasonable when you discuss their
behavior and what needs to change in private. This even includes the case
where a temporary suspension had to be put in place already first, to
protect others.

Lastly, a forced apology puts any victim into the awkward position that
they're forced to decide whether they want to accept the apology, or
reject it. This essentially offloads part of the CoC enforcement work onto
victims, which often are not the ones with the power to actually stand up
to problematic behavior.

Note that I don't see this as a nack, just a heads up that there's a
potential conflict. I'm not worried though since Dave and me know pretty
much everyone involved in both CoC teams. I'm sure if this ever becomes a
real issue we can bridge things and figure out a solution.

Cheers, Sima

> +
> +Remedial measures if there is no public apology for the violation
> +*****************************************************************
> +
> +The Code of Conduct Committee determines the next course of action
> +to restore the healthy collaboration by recommending remedial measure(s)
> +to the TAB for approval.
> +
> +- Ban violator from participating in the kernel development process for
> +  a period of up to a full kernel development cycle. The Code of Conduct
> +  Committtee could require public apology as a condition for lifting the
> +  ban.
> +
> +The scope of the ban for a period of time could include:
> +
> +    a. denying patch contributions and pull requests
> +    b. pausing collaboration with the violator by ignoring their
> +       contributions and/or blocking their email account(s)
> +    c. blocking their access to kernel.org accounts and mailing lists
> +
> +Once the TAB approves one or more of the measures outlined in the scope of
> +the ban by a two-thirds vote, the Code of Conduct Committee will enforce
> +the TAB approved measure(s) in collaboration with the community, maintainers,
> +sub-maintainers, and kernel.org administrators.
> +
> +The effectiveness of the remedial measure(s) approved by the TAB depends
> +on the trust and cooperation from the community, maintainers, sub-maintainers,
> +and kernel.org administrators in enforcing them.
> +
> +The Code of Conduct Committee sincerely hopes that unacceptable behaviors
> +that require seeking public apologies continue to be exceedingly rare
> +occurrences in the future.
> -- 
> 2.40.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

