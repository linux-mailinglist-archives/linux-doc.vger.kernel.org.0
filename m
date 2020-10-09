Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537DF289189
	for <lists+linux-doc@lfdr.de>; Fri,  9 Oct 2020 21:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388312AbgJITDC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Oct 2020 15:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388319AbgJITDB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 15:03:01 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B09C0613D7
        for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2020 12:03:01 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id r7so1442437ool.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2020 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=baW1j40oyrw0/DNHh12A7dHdJ/z3IBrTCGUzSy2Qt0U=;
        b=LuV4RossWWWXsKmwY82qfvFub19Uko9+f82C66MWZzlHewluwlddL6Ng5uIlyVUujU
         7he0hdbrv2QoTpWj/BjRl3+E8Fgqdqc9v+hiKB/oiiNO9/XGGP3Y5D+ijhz4yxfXBglR
         8VWVsO7kW6GmEUCVWOwofF2kCvJG2GGJslM6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=baW1j40oyrw0/DNHh12A7dHdJ/z3IBrTCGUzSy2Qt0U=;
        b=eIQ6ndmMLR/yLAqOon6ECcE4/Cscgph+eiMp5bsumXfGxycwnOKQ345zktfSrzvoUP
         fVfbXq3rsfhLyChsXN9jj9kllid5klqsZKSM6rzc1GBJzrc+tYtR7PAxDcmKHAWzfYbW
         yuZFy5iMAccU0kJnM2RLWarwmXwa7oXok9D6WJqNhCR/SwuDPEpp+J5e6N2PqhHmaWEJ
         YKTosA0k8YqoTW77T5PIoCDctcrf2+NPxEXyCbQ2259VLNM+RBMjGo4SZUg2sTpYw2Tk
         3EZIitF14XYaHhPOv2gtJHKQH5GgqZrrrVtEJlnNg8XhS0XAg3ayhOoWAMi4ERDxYahd
         Ivcg==
X-Gm-Message-State: AOAM5317ejV2xZgTsd9F06g8bM4iQ5P4FR+HCjJhZ6sJrdpPdZRhu6BF
        5d9E80wUXp5cGMrBCl7/bUgbVg==
X-Google-Smtp-Source: ABdhPJxv030p5ja0y94Ai5/nITr9cpyq/0eTrPjpyWHsIwF3zqGECh6eEbU8oCnYLS5HMWOrAMlbbA==
X-Received: by 2002:a4a:e758:: with SMTP id n24mr2076315oov.62.1602270180802;
        Fri, 09 Oct 2020 12:03:00 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o16sm7608048oic.27.2020.10.09.12.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 12:03:00 -0700 (PDT)
Subject: Re: [PATCH v3 00/11] Introduce Simple atomic counters
To:     Kees Cook <keescook@chromium.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, shuah@kernel.org,
        rafael@kernel.org, johannes@sipsolutions.net, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de,
        arve@android.com, tkjos@android.com, maco@android.com,
        joel@joelfernandes.org, christian@brauner.io, hridya@google.com,
        surenb@google.com, minyard@acm.org, arnd@arndb.de,
        mchehab@kernel.org, rric@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@driverdev.osuosl.org,
        openipmi-developer@lists.sourceforge.net,
        linux-edac@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1602209970.git.skhan@linuxfoundation.org>
 <202010091103.5E435B42@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <beca7980-9796-9b7b-3ae8-cdd0eb022bb6@linuxfoundation.org>
Date:   Fri, 9 Oct 2020 13:02:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202010091103.5E435B42@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/9/20 12:03 PM, Kees Cook wrote:
> On Fri, Oct 09, 2020 at 09:55:55AM -0600, Shuah Khan wrote:
>> Note: Would like to get this into Linux 5.10-rc1 so we can continue
>> updating drivers that can be updated to use this API. If this all looks
>> good, Kees, would you like to take this through your tree or would you
>> like to take this through mine.
> 
> I'd mentioned this in the v2, but yes, please take via your trees. :)
> 

Sorry. I missed that. I will get take this through my trees.

> I'm glad to see this landing!
> 

Thanks for reviews and brainstorming ideas. It has been lot of fun
doing this work.

thanks,
-- Shuah
