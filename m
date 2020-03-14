Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77528185316
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2020 01:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbgCNAAw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Mar 2020 20:00:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33714 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgCNAAw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Mar 2020 20:00:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id m5so5948649pgg.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2020 17:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iO0VXAVsDr+jrGc2J5VMFCqZrTIBZSEm85Bpnc3jnQw=;
        b=cYSyUkpLqfBDrimiPCGrZ79sbUkn6OZZNkn0mT+p6AESDR+MxB3Dxbi3LjI/XHBEW0
         jixSKhJWgdpU6yy4PIgSDKDVr05W3yE0MMHMkyEYQ0QvSD+dDfcZzHQA1CRsP3MY5DYR
         uTxo4dsaxj6JsYpZ069X8V6Ve+7rjWrhxGdJpCrjCdaJTTQjMVRHcizfAJIbCMaholIZ
         9RsZVhRsmEz8eH9JOhwM4U92rpbpmZt2XwW9KsSc/gjBI75CfD7ZgfMM2BgrfIaEEtqb
         AxLAsuf8+pkN1Yz8uwR8NqYWJamWHPoEMMi/4id5n8wmtaZT8XO7rx69q+NvSA9T2BvE
         DANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iO0VXAVsDr+jrGc2J5VMFCqZrTIBZSEm85Bpnc3jnQw=;
        b=G5KyiyZI7wouQNBEMSiLV52IwlsVGsd/tT6Y410pjp2ly7X+xPfUAuvOtSvK9f5MRg
         UUCDZn+Codvj+WhZcu0lEiY8oNZXY/vmWSR216T4Uhm7CDvnhfLpkHjgJr1nea2ron3q
         xCzbHDEES31Q9njfEf+bIvDgnAbvxcY3HJNyC/kPiDHVuWHC9BftOhAF9zMivDWeaKYb
         DIXf6P7j4OM6m5OLKyRZPcqoVngjx0DzH6Y0AQVNB0zJySgDW/NtP1njleGdYD0MQTls
         yQUQzlah8WSXDL9X8YJ+jmkcUh8RQgvi0sxWfcQFheRER5vrMhjN52hFv6CKxa9tWKhB
         XLfg==
X-Gm-Message-State: ANhLgQ2EVVkyvo+O5nl5qFonVbMn/669kCzaIgvmAo12Z+xgo3wFz30w
        QiOaLBv+Sm0Cdw2RnEjD11KUQSBYt893rCbV1OEX7A==
X-Google-Smtp-Source: ADFU+vtgMeZwS04JEhC1+g+bpbuAE/Pax//u8KT5l5j2FKkS6CojvWXcPfv6kJ7ELgKrpBqLBkgAlIbqYOSj0IlhGSw=
X-Received: by 2002:a63:650:: with SMTP id 77mr15213263pgg.201.1584144051096;
 Fri, 13 Mar 2020 17:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <1584110682-3837-1-git-send-email-alan.maguire@oracle.com> <1584110682-3837-4-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1584110682-3837-4-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 13 Mar 2020 17:00:40 -0700
Message-ID: <CAFd5g44HG2U8oFYvvjcVPYOvom07+JeTMpGqLtyKGnHQh5+sEA@mail.gmail.com>
Subject: Re: [PATCH v7 kunit-next 3/4] kunit: subtests should be indented 4
 spaces according to TAP
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, shuah <shuah@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 13, 2020 at 7:45 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> Introduce KUNIT_INDENT macro which corresponds to 4-space indentation,
> and use it to modify indentation from tab to 4 spaces.
>
> Suggested-by: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Frank Rowand <frank.rowand@sony.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
