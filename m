Return-Path: <linux-doc+bounces-13496-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71B898BFC
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 18:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7F73B2A065
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 16:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863F712BEAE;
	Thu,  4 Apr 2024 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0NLcUFj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AAE74BE5
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712247500; cv=none; b=Hkcb9vm/FLQ/Nazyt5BzjAn2c2hJt6bGRwuJg1k5VxZ2SmSMxdjFEWP/gD/RTWmlMmpV7vJjKpQ12r63PkyJI0YKJhKtzrpWhZvWGuLGEI5LI4IkYZLAoDdiPEI7ZwW4tfzg6xBrm3p2czCLmd4m0YQQpPAmVPhzv9kxLKYFBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712247500; c=relaxed/simple;
	bh=kAsemLpZF5gvKF3iRwKXe1owEO24xjO+cbsWgliCEOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qpw3rhM6PrfDlJMR16jDkqww3i6VlGJHIP6EpFVTMy+gVH1tLPWAc5bBoB0Vg38I2jKIlEdMGzscNaAseNyTNCT/D7TPRxHOkJy63hUMLDtlfjFQZAqpy4mdzpvmyS9fSWmJNAxWh1Qr6qBHnu6JGiy99YrSiyuo142hrsWZxEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0NLcUFj; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6150670d372so13011777b3.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712247496; x=1712852296; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y2wfhwpj0GJm8stfsi7qk1/VC2m7+vGnm3FHrvFy46A=;
        b=M0NLcUFjVKZsas5aVDZFMt5H3vMmpH8MA3sTixXN0aOOTXrEHrWqHdkEqu6dJhG5py
         hmew0kuq774jr2yR6ZDX6vw0lkzlyGMXZpXeTH5w5HuJqfRrds19NTGFX+jbVj9tiGeQ
         H1EdmAq2hKj1zPToCPKkDF6vAn+GTBfZ9jUu+WThorTvYtFDSM66flcEJuji4HXHvQNe
         PUli+pCCsIcbwDexvSrsnzL0i7Ynh62gCu8gV/v7dQH+QSFgi20NwYkRjJbellKn/9Vt
         dIF74+hNZ4t/ITA9wV+YWPOf7SYV5CkcCmj2ezLLLCP0WJcRllVYmJ2qQtYainx++S0U
         3HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712247496; x=1712852296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2wfhwpj0GJm8stfsi7qk1/VC2m7+vGnm3FHrvFy46A=;
        b=IYPFb4qcMkTOzFimLanSI82hug8XA924jQgCWrqlCLXjAlaA2AOAxYS4Y0DXiITNyj
         OpssFbI/qm65mIsksJsvb0hAub+UjqMqiTi53Lrs9RfeyTALTlZMqg/qWLp/AfeZnf4i
         8vRUp+rF+dnb8cy7etXvpkM7Q10QLMxOLSVRXthM8ARJbLjCMf9h7tjXu4FaGwoubiba
         BTpMgxokUb9yIBWukaGws67D+B5fy02b8PSpX2nWATlmtYgetA0dW3FH4nbUR2iLdW6z
         prLlM5OGdSpBiDRammEdr/Z2NJ1Lx1MpUPIKuutl9CdH5KsNoQinp5DFdM+gGq98Nma2
         SfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy218gpPCrWaNqEAuS0p6x1qbo7FyYf+a3KbP1/pWwvYyEAQXwz2Ks6gDurq6j4GYtkBIHAandDvJAuFsRpwZMK1oCSOYQ6GZP
X-Gm-Message-State: AOJu0YyYdXxBFn/1CRw7zN15+9TSE0SYqvP1wDvvJgU75XZM58lgklzs
	JGT7aVSbCHZqCSPLbuls2Bq3fO4xRBpuxaDiwuwpxXpd/Gj2SBVgbzpXj3iYAZ464Hg6Ab5WMkO
	7Z8EvPJK9VasV+kKU5QPv9pPabCldM5NADj0msA==
X-Google-Smtp-Source: AGHT+IGZ1IsW5nVT5b4ImkAVo1aGzZo+2+alfh2eRUC563al7JWgpLpAeRPbbZe+AU7DlbaHjZwMfNJDOEDMGTtobIc=
X-Received: by 2002:a25:8412:0:b0:dc7:594b:f72b with SMTP id
 u18-20020a258412000000b00dc7594bf72bmr2550436ybk.39.1712247496552; Thu, 04
 Apr 2024 09:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-additional-trailers-v1-1-f472bf158d2f@linaro.org> <ZgxVqIwPxiFtcBrB@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZgxVqIwPxiFtcBrB@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Apr 2024 19:18:05 +0300
Message-ID: <CAA8EJppRB57ra7oqjrDM8bGt7b90_56HJPQ3gPeTFy6fiMBLKw@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: describe additional tags
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 21:59, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Mon, Apr 01, 2024 at 08:17:03AM +0300, Dmitry Baryshkov wrote:
> > Described tags do not fully cover development needs. For example the LKP
> > robot insists on using Reported-by: tag, but that's not fully correct.
> > The robot reports an issue with the patch, not the issue that is being
> > fixed by the patch. Describe additional tags to be used while submitting
> > patches.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/process/submitting-patches.rst | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> > index 66029999b587..3a24d90fa385 100644
> > --- a/Documentation/process/submitting-patches.rst
> > +++ b/Documentation/process/submitting-patches.rst
> > @@ -544,6 +544,25 @@ future patches, and ensures credit for the testers.
> >  Reviewed-by:, instead, indicates that the patch has been reviewed and found
> >  acceptable according to the Reviewer's Statement:
> >
> > +Additional tags to be used while submitting patches
> > +---------------------------------------------------
> > +
> > +The tags described previously do not always cover the needs of the development
> > +process.
> > +
> > +For example, if the kernel test robot reports an issue in the patch, the robot
> > +insists that the next version of the patch gets the Reported-by: and Closes:
> > +tags.  While the Closes: tag can be considered correct in such a case, the
> > +Reported-by: tag is definitely not correct. The LKP robot hasn't reported the
> > +issue that is being fixed by the patch, but instead it has reported an issue
> > +with the patch. To be more precise you may use the Improved-thanks-to: tag for
> > +the next version of the patch.
> > +
> > +Another frequent case is when you want to express gratitude to the colleagues,
> > +who helped to improve the patch, but neither the Co-developed-by: nor
> > +Suggested-by: tags are appropriate. In such case you might prefer to use
> > +Discussed-with:, Listened-by:, or Discussed-over-a-beer-with: tags.
> > +
>
> I really like the idea of defining two additional tags for these
> purposes ("Improved-from-review-feedback/testing-by" and "Cred-to").

I think that the from-review / from-testing might be too verbose. I'd
prefer to keep the existing tag.

As for Cred-to I'm probably missing the usecase that you have in mind.

>
> I do however think that in order to gain acceptance and widespread
> usage, they need to be defined in the same clear fashion as the entires
> under the "Using Reported-by:, Tested-by:, ..." section.

Of course.

>
> Regards,
> Bjorn
>
> >  Reviewer's statement of oversight
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> >
> > ---
> > base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
> > change-id: 20240401-additional-trailers-2b764f3e4aee
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >



-- 
With best wishes
Dmitry

