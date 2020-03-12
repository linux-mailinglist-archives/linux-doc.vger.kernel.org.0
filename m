Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B581831F6
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2020 14:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgCLNsC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Mar 2020 09:48:02 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46652 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgCLNsC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Mar 2020 09:48:02 -0400
Received: by mail-io1-f66.google.com with SMTP id v3so5686642iom.13
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2020 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JQXIGCXCcQkX5b0h95Wn70qT4Lsg/1L/D4OIHLSiNCA=;
        b=NlWfLO/fYNg9mLVfR9yLiSb1v37zDB/6P3U6ychPiHzh5TDCvUkTE5txbHWJvt5p0o
         cYxYiIIgF42V7QUW4zYohjpFh1DByWUcNJGrI5BLB3jo8P/c6DNUSDofvxc71QAI//lh
         s2rmzVQrJkeA3BpNaZ5Ra+UQauJZkZE7RZR0thXR+bXuy6C29p1kuHZ5vlb/T8rEqrdu
         fAMvuzFZ+qzz5SWgqnvQTNlRh/yyt+Gwq9ILZ3gR+jqBHmStJJHG6iFv4z8Jc57MSaRZ
         4KuKPaEkEK0NGzF1pAC+EeVCtxAqOS8Y+K5Zo0A8B4HQ2WG6mEWH79+BEVMb/ZdXa1gE
         Z8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JQXIGCXCcQkX5b0h95Wn70qT4Lsg/1L/D4OIHLSiNCA=;
        b=tMiGBgN+72LDxuQ6qaSoqueHJYBi6vu3bFuoDyVlKj9/wtN8xIfZyb83Nmk2k2VwLV
         m5L89/mtv3m0cZ+tV3ch6QfT+/frONLbSUwLixrbxzF/jVDcb2X416OV+0cE7aL1NXaY
         jvKut6WZi0M/TDZJQrlGqutF7R+WGqFGti/LtT+9zwzHudCf3urs4H7828vkc42aUjyp
         71k2Ji4jWfs1uNqn2C0MstZsiOcxZNlKDnb5Of9w16JIjDfrnCHCOgFgZcFKcBHmpwl3
         X97jcGnhQv0NdTyBKQX/CZN3pOcpUwH1HO7xH10nR9WiF99cuXcRlraE83+dmuQ5ltor
         oBQw==
X-Gm-Message-State: ANhLgQ2LJiHDiqcr/J3vwn+vCSgAkYrZdT37ZkHci5Zplfx91tn7Xplu
        tbnXH38Rl0kqIJotfjin64zKbA==
X-Google-Smtp-Source: ADFU+vsWK0+qm1KrXJJJWqWO/Zr+xTuuiQe26ah9eyr/b3281WjdadrCklpN3z38eqR/yRWhcY09BQ==
X-Received: by 2002:a02:b894:: with SMTP id p20mr8035881jam.86.1584020879998;
        Thu, 12 Mar 2020 06:47:59 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id y71sm4689317ilk.23.2020.03.12.06.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 06:47:59 -0700 (PDT)
Subject: Re: [PATCH v2] Document genhd capability flags
To:     Stephen Kitt <steve@sk2.org>, Matthew Wilcox <willy@infradead.org>,
        Jan Kara <jack@suse.cz>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200307145659.22657-1-steve@sk2.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <ec5479a2-138b-3da3-e09a-edaca6292fb6@kernel.dk>
Date:   Thu, 12 Mar 2020 07:47:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200307145659.22657-1-steve@sk2.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/7/20 7:56 AM, Stephen Kitt wrote:
> The kernel documentation includes a brief section about genhd
> capabilities, but it turns out that the only documented
> capability (GENHD_FL_MEDIA_CHANGE_NOTIFY) isn't used any more.
> 
> This patch removes that flag, and documents the rest, based on my
> understanding of the current uses of these flags in the kernel. The
> documentation is kept in the header file, alongside the declarations,
> in the hope that it will be kept up-to-date in future; the kernel
> documentation is changed to include the documentation generated from
> the header file.
> 
> Because the ultimate goal is to provide some end-user
> documentation (or end-administrator documentation), the comments are
> perhaps more user-oriented than might be expected. Since the values
> are shown to users in hexadecimal, the documentation lists them in
> hexadecimal, and the constant declarations are adjusted to match.

Applied, thanks.

-- 
Jens Axboe

