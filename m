Return-Path: <linux-doc+bounces-30577-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79C9C6159
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 20:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04DA1283352
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 19:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1815219C88;
	Tue, 12 Nov 2024 19:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kOFYZ3Iu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036E12194BE
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731439289; cv=none; b=ho9YMVJ4IhwVPM61Sgl3wJHMJyvc5W5JUcCuH8vjMCHHPUHZd4xax9lwGKlbx0pRMfIRoexQhuPOLnh73Tk6hxQzNA3+B41wnZuzZ1BI6Yziv7hIKo+NmsZg8c4XdpPK2YZnQNccVK98JViBLdM6+7BOIZ7vlttc/kEi2Z4ADx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731439289; c=relaxed/simple;
	bh=yE45QrhNWmhn/fkyErZOdv2B/yQ4TBW/IkZmciYJkDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsBx+RrQ/IiTqiYoW3l1XSuTlR21SkIeyYvqOjfvrmlGQLZscZskBML1d1son+FmUooFfVgsAcW7iYF7GL9N8Y4uu0Ala73io3XhhWJq0pFNf1o6QSY/uOMd6isthgkhglFxbrsylYD+em9HooLYviTL7hkbbgV/1sCDx1Mit9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=kOFYZ3Iu; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e601b6a33aso3570117b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1731439286; x=1732044086; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KdLsB2RmvIaNhuM2RQrjIGniDaG3gtn+FYYbXQwyLjQ=;
        b=kOFYZ3IulBK375eW1ZuKRiveMYUhhQl9BaF+/Nrtw+5aD55ITnD6jWAmTlhkd3pwrs
         XChBnwST1bZIww6fVKbvxif/jAqRnMNN0Eo3DEGg4nMcTr2e0zPEV6GLpfAFaP97Qnbl
         MaCfjPyQc/kB0ypdJHateZ9Cn0YVwUct0QdZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439286; x=1732044086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdLsB2RmvIaNhuM2RQrjIGniDaG3gtn+FYYbXQwyLjQ=;
        b=jDTlkJzpk9eYITZzj4gDYMZEjWLshJpRn2sSu1Hmh3JLHUSWzLpGoJ5YWHJU/Xl18J
         ydm0F2aKKTZivyU9lteif9udOVmwXEX0WL9KsOZa9Y9Xv8gISDifVH2ihWDSUwLnOGvB
         4AH/zyWyV0lxrdf0+OfZMNfC9xo0n5a7B+yxoyV16+lsuZpWN/UNBt9/c/CDBCxyabyd
         /2NbT2BkJP/6NuSN/pnMJI308yPf8MtUJjc5E57bHjcYRnIEhZrZaMM45/b1LRy5zSP5
         OD7bo2mOul7bCN/iLTqo/fKUnqA06xjJh7l/b+djz8iqUlvpRcKYEpA6vxceel1KnGMo
         eJkw==
X-Forwarded-Encrypted: i=1; AJvYcCUosjP+rb5/Yfnrz4PM+2cGhxqnmirOocW0ciNcMcfksv2R47m0VNRYPqATG4Ne4PqIdAqZnxkphkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmSfQagtL5mPcQqUShfNgcH3WFa3PRpO7tiLLIUtjV2WBYGMM
	OFEtJaPZhFGMJ8OBLQr+/ICPzRLx6XSQLRDtYE3ymCPnL0othgU1zje10AKQnoiMvLunO2tAGOZ
	qKYsQK2inbO9JI4jPLjzyDatbxcUidCccAF6rHQ==
X-Google-Smtp-Source: AGHT+IG8MZOfUN1iQ3EJafqKXedS2lIEywdwom52FQH7gICN9ovIXOS7HUYpRMgTzYVe1l/BK5FWaXivkAr8ZVcdAbg=
X-Received: by 2002:a05:6808:1302:b0:3e0:7441:e487 with SMTP id
 5614622812f47-3e7b0ad78b4mr98755b6e.37.1731439285895; Tue, 12 Nov 2024
 11:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111163723.9002-1-skhan@linuxfoundation.org>
In-Reply-To: <20241111163723.9002-1-skhan@linuxfoundation.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Nov 2024 20:21:15 +0100
Message-ID: <CAKMK7uGS3FJVp690She5d+XbQV5x7yQFPozta4cfnzga-BYAOQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Dan Williams <dan.j.williams@intel.com>, 
	"Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Nov 2024 at 17:39, Shuah Khan <skhan@linuxfoundation.org> wrote:
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
> Acked-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>
> Changes since v1:
> - Updates Acks with Ted's ack.
> - Fixes subsection formatting as per Randy's suggestion.
> - Fixes a spelling error.
>
>  .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
> index 66b07f14714c..ebddf218341d 100644
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
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The Code of Conduct Committee publicly calls out the behavior in the
> +setting in which the violation has taken place, seeking public apology
> +for the violation.
> +
> +A public apology for the violation is the first step towards rebuilding
> +the trust. Trust is essential for the continued success and health of the
> +community which operates on trust and respect.
> +
> +Remedial measures if there is no public apology for the violation
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The Code of Conduct Committee determines the next course of action
> +to restore the healthy collaboration by recommending remedial measure(s)
> +to the TAB for approval.
> +
> +- Ban violator from participating in the kernel development process for
> +  a period of up to a full kernel development cycle. The Code of Conduct
> +  Committee could require public apology as a condition for lifting the
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

This is a detail I missed at first, but I think it's a very important
one and needs to be highlighted.

Years ago when the kernel CoC was put in plae, there was a very long
discussion around whether maintainers are required to enforce the CoC,
or not. The rather strong consensus was that they are not responsible,
but help is appreciated, as documented in this patch: c1d1ba844f01
("Code of conduct: Fix wording around maintainers enforcing the code
of conduct")

This was also acknowledged once more in a patch merged two years ago
with c1d1ba844f01 ("Code of conduct: Fix wording around maintainers
enforcing the code of conduct") by changing "decisions by the
committee" into "decisions regarding enforcement recommendations", to
make it very explicit that they're just recommendations to the TAB and
maintainers and that the CoC team does not have independent
enforcement powers.

The approval by the TAB is still here, but maintainers don't seem to
get a say anymore. Is this the intention, because it seems to be a
really substantial change? From our experience on the fd.o side, there
is a subset of maintainers who do not appreciate this responsibility
at all and very much would not like to have it. Given that, and the
kernel's strong consensus a few years ago against this I don't think
enlisting maintainers for enforcement without a wide agreement is
going to be well received - even when personally I think it's the
right approach to CoC enforcement, I did not put an ack on that patch
for clear reasons.

Also, if a maintainer refuses to implement an enforcement decision,
will they be sanctioned too? Since this is all an entirely new section
and does not touch any of the existing sections I'm also not clear on
when one or the other rules apply, and how they interact.

This part looks confusing to me, and a bit in a scary way.

Cheers, Sima


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
>


--
Daniel Vetter
Software Engineer, Intel Corporation

