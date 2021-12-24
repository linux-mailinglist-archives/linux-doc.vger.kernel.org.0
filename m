Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBE947F09E
	for <lists+linux-doc@lfdr.de>; Fri, 24 Dec 2021 19:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353451AbhLXSyx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Dec 2021 13:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhLXSyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Dec 2021 13:54:53 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC455C061401
        for <linux-doc@vger.kernel.org>; Fri, 24 Dec 2021 10:54:52 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a9so18880336wrr.8
        for <linux-doc@vger.kernel.org>; Fri, 24 Dec 2021 10:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=hmsXsNLXE43Va6e06LwXXUZ5itPReXgaauNUG0mMlluiyAhdLUULB4OAFqqdogTZsZ
         E0iyi5vjc02VCTnFHZMzOesnJ/+4CboxVLZqwGqAn4Ddl/0RfWyfaKllaRHdhRG5ynVX
         2aFg2/83LuySuhgmcQboWLeiTIaTH3i9YlDlniJJbMVD3p6J+wXMivwcsW9YpnGdMeB0
         2enhXMzsnrVx61yh9PP/2FlfybJzPfU1xul2vD0wP6emtsEp7uiCNoXRthkExb7h+Www
         4nyLLsHaV5zx4rFnI2aCFJM3tblQL5rUNk6yl98Q4yHQY4Gvyx/rJf6Lyqbry+h/O+p4
         c73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=UtoF0r4yG8U/T8UOLxn8dacSd49m7zi2Qvhr7fGOaoo=;
        b=vparQYLOAIQtkyx0qDZmT+CTMHEL/7vqvnYhLWQMNs6yykGmXXG6qoyD0hc4jircBQ
         PL3rntGmmhRYt3Vs9hqDHqLuVov6fhv1WJSpt7jUo3tXqzheGBMyay2QieDQr/PwDxOs
         NQRtTONhchdFd2zpoCFh3CRWgUrlW1xLlPMe2nj0K5bRQCn3DTC2/h6k7mt2SB/aL4Pp
         kqvQIlA8VIs9IMmr9+4bznUCRns2KJ99aji9vOGlpfmbM3xX3J3xmHc+ZolwKsU/7R8F
         QdqJKrFevV/qq4zOVFT5mENWkIedQgb3jQKq7L1wEFdkFi3+dTI+8RbvoL1HbVJlc6BK
         1VtA==
X-Gm-Message-State: AOAM533QEG9KCwWjqjCMA1R0s5pYDaWeKfe6dtPWSqqN8CZnin9uKxjO
        eTlz9LU70/4vdM9cjpw7tnw=
X-Google-Smtp-Source: ABdhPJwU38zmN4owgWi6Gv0NTc2HNt1iej2LKRya1oY4c0MBsBv0zzAs/JS4q/h4AptJOOOYNHQQow==
X-Received: by 2002:adf:dd83:: with SMTP id x3mr5494856wrl.367.1640372090822;
        Fri, 24 Dec 2021 10:54:50 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.108])
        by smtp.gmail.com with ESMTPSA id o2sm8023497wru.109.2021.12.24.10.54.46
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Dec 2021 10:54:50 -0800 (PST)
Message-ID: <61c6177a.1c69fb81.c52a1.40c6@mx.google.com>
From:   Margaret Leung KO May-yee <jogbodo12@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Fri, 24 Dec 2021 19:54:42 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bin Frau Margaret Leung Ich habe einen Gesch=E4ftsvorschlag f=FCr Sie, erre=
ichen Sie mich unter: la67737777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
