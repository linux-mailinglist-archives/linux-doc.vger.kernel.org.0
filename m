Return-Path: <linux-doc+bounces-17909-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848AB8FF947
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 02:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D9091C233F3
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 00:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E411474A9;
	Fri,  7 Jun 2024 00:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jjn90raK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D0813C9AF
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717721521; cv=none; b=B29xFtu2P5TAFUXhqAeWpFCcipVG2bAIZIyzSbI4X/lazZ3hSiIJxxrwPr2rHeine9d6OeQR2ca7Nn6j8ct8wX0OBHdlgCJ4K/19W++Lgq0QpikUhinLKaD0BVv8si6Wvl2MgRDNsSrIFHJo1URc6rZG7VagBzE03bJYXZzlNEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717721521; c=relaxed/simple;
	bh=f9VsrjuCX6q/T5RS3zWwoZ3HtwjQAo1nlQZyi7PhpT8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t6UlxRwRGCm9en55BhGK+QzsCqleWT+X8iV61aaLJDC2AkgjXVwTJQcjqQRzGXvQf611CTvXKiJrEasfoxVFRm28wdareqxoea33G+Bd9uJEEu3LBb9DsLHZE/OZqOxkC+qjeq8kRCb/o+mb4PAMZPt5W3kIQ2ivW6O3R0PfHyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jjn90raK; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfa74b3e6cbso2775489276.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Jun 2024 17:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717721513; x=1718326313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lhomENoNfMaJWS7XUI4qqmt9JkG0zt+Z7c540SVLWSw=;
        b=jjn90raKqtliehPqv5N54uK/P+H3ESguztiVBaizAE+BtqsehsgX5QeNHSPfP5HgSq
         oVMFiObqsZcL7Ga3e0Tt/cK4SIdLXGIqkRq6X+NR1MQTvSU/mZvZi2Gau4KCiyScaXSy
         MLO89h1Lvn7gMNnR5g5O1vi0aQ8i25z+cT13+sChRnuJBNquffp0R2gPcRzA3Qcha48y
         dGphhH97Qc7xQKWLyv4tBi58exW7GR9Rbt0031eztPAu6NbVVVPGqvtFQZ+oyQ9gN8AS
         6BdxPLYr08ydcKWUh1YKaT32FuhzrtOfkbXBdTSrcLsCI3QTOYGQwFuliLSvdAtSRibt
         /FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717721513; x=1718326313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhomENoNfMaJWS7XUI4qqmt9JkG0zt+Z7c540SVLWSw=;
        b=n5IG3B+xQerwUe/3cpCaa9XAb4c9puOhCgvpGYIpYhf/Qs61O8XjM97RH4/d9G6c8+
         o2hdtsioW1MrYSqVbsKjcTUSmQ1nNvk4HmNVlu2rYDGPGWOrhwj0I5mP5UHtYn+VTKNC
         0wURacO9gkAzS9wCxoKvG7l97XYa5X/8aO3os7+UlzOob4inbfPnQYttyfsdFwUf6Lk7
         RjHGgLw2cHnmoam2JjoIzAEL4zu6rIuz093qSV+GYjdCAihYRT/2IQvtGzErKXkv8Wd/
         H/U9jYEYeXOoRTuLRai85dFDS1oEOW2Oi7hwEfE1zpJca7vTXUfjLa3XgEPcHzR800ko
         y6mw==
X-Forwarded-Encrypted: i=1; AJvYcCWbk4TxI1HwP4EAP3w3vD/2hx1/m1MXaiVVciAiBp7B+TrMpWLkZprjBmTAZXY4Zhcpd4r43vz/txu3sAzTJakPRYx4HkzJD/zU
X-Gm-Message-State: AOJu0YwfjRShTbTFfQtiMCUGThP0P1tbpejjSDg7kggv7WG01hEYJit+
	2LBlmfkXMrs6H7uzmH9PJv9XbkRKL3svetkFMUoICBfP73/vNyZAo/hFGFyfL7PR9RW5EN8d8en
	aiBm21der0ruxIFNymLVFsw==
X-Google-Smtp-Source: AGHT+IHulp3WRreZYBeMqEA29tM628XkajZcUYUjC0qASb/5/vDW+PfycqvZv/ZgmZ7MUky7X4hHrH9R/rgGpufsNA==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a25:df01:0:b0:df4:db4d:5db2 with SMTP
 id 3f1490d57ef6-dfaf6593c78mr188900276.7.1717721512592; Thu, 06 Jun 2024
 17:51:52 -0700 (PDT)
Date: Fri,  7 Jun 2024 00:51:21 +0000
In-Reply-To: <20240607005127.3078656-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240607005127.3078656-1-almasrymina@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240607005127.3078656-12-almasrymina@google.com>
Subject: [PATCH net-next v11 11/13] net: add SO_DEVMEM_DONTNEED setsockopt to
 release RX frags
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an interface for the user to notify the kernel that it is done
reading the devmem dmabuf frags returned as cmsg. The kernel will
drop the reference on the frags to make them available for reuse.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v10:
- Fix leak of tokens (Nikolay).

v7:
- Updated SO_DEVMEM_* uapi to use the next available entry (Arnd).

v6:
- Squash in locking optimizations from edumazet@google.com. With his
  changes we lock the xarray once per sock_devmem_dontneed operation
  rather than once per frag.

Changes in v1:
- devmemtoken -> dmabuf_token (David).
- Use napi_pp_put_page() for refcounting (Yunsheng).
- Fix build error with missing socket options on other asms.

---
 arch/alpha/include/uapi/asm/socket.h  |  1 +
 arch/mips/include/uapi/asm/socket.h   |  1 +
 arch/parisc/include/uapi/asm/socket.h |  1 +
 arch/sparc/include/uapi/asm/socket.h  |  1 +
 include/uapi/asm-generic/socket.h     |  1 +
 include/uapi/linux/uio.h              |  4 ++
 net/core/sock.c                       | 61 +++++++++++++++++++++++++++
 7 files changed, 70 insertions(+)

diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
index ef4656a41058a..251b73c5481ea 100644
--- a/arch/alpha/include/uapi/asm/socket.h
+++ b/arch/alpha/include/uapi/asm/socket.h
@@ -144,6 +144,7 @@
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	79
 #define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	80
 
 #if !defined(__KERNEL__)
 
diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/asm/socket.h
index 414807d55e33f..8ab7582291abf 100644
--- a/arch/mips/include/uapi/asm/socket.h
+++ b/arch/mips/include/uapi/asm/socket.h
@@ -155,6 +155,7 @@
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	79
 #define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	80
 
 #if !defined(__KERNEL__)
 
diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
index 2b817efd45444..38fc0b188e084 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -136,6 +136,7 @@
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	79
 #define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	80
 
 #if !defined(__KERNEL__)
 
diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi/asm/socket.h
index 00248fc689773..57084ed2f3c4e 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -137,6 +137,7 @@
 #define SCM_DEVMEM_LINEAR        SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF         0x0058
 #define SCM_DEVMEM_DMABUF        SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED       0x0059
 
 #if !defined(__KERNEL__)
 
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index 25a2f5255f523..1acb77780f103 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -135,6 +135,7 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	97
 #define SO_DEVMEM_LINEAR	98
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	99
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index 3a22ddae376a2..d17f8fcd93ec9 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -33,6 +33,10 @@ struct dmabuf_cmsg {
 				 */
 };
 
+struct dmabuf_token {
+	__u32 token_start;
+	__u32 token_count;
+};
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/core/sock.c b/net/core/sock.c
index 69baddcfbd8c1..41586277c8dbb 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -124,6 +124,7 @@
 #include <linux/netdevice.h>
 #include <net/protocol.h>
 #include <linux/skbuff.h>
+#include <linux/skbuff_ref.h>
 #include <net/net_namespace.h>
 #include <net/request_sock.h>
 #include <net/sock.h>
@@ -1049,6 +1050,62 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
 	return 0;
 }
 
+#ifdef CONFIG_PAGE_POOL
+static noinline_for_stack int
+sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
+{
+	unsigned int num_tokens, i, j, k, netmem_num = 0;
+	struct dmabuf_token *tokens;
+	netmem_ref netmems[16];
+	int ret = 0;
+
+	if (sk->sk_type != SOCK_STREAM || sk->sk_protocol != IPPROTO_TCP)
+		return -EBADF;
+
+	if (optlen % sizeof(struct dmabuf_token) ||
+	    optlen > sizeof(*tokens) * 128)
+		return -EINVAL;
+
+	tokens = kvmalloc_array(128, sizeof(*tokens), GFP_KERNEL);
+	if (!tokens)
+		return -ENOMEM;
+
+	num_tokens = optlen / sizeof(struct dmabuf_token);
+	if (copy_from_sockptr(tokens, optval, optlen)) {
+		kvfree(tokens);
+		return -EFAULT;
+	}
+
+	xa_lock_bh(&sk->sk_user_frags);
+	for (i = 0; i < num_tokens; i++) {
+		for (j = 0; j < tokens[i].token_count; j++) {
+			netmem_ref netmem = (__force netmem_ref)__xa_erase(
+				&sk->sk_user_frags, tokens[i].token_start + j);
+
+			if (netmem &&
+			    !WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
+				netmems[netmem_num++] = netmem;
+				if (netmem_num == ARRAY_SIZE(netmems)) {
+					xa_unlock_bh(&sk->sk_user_frags);
+					for (k = 0; k < netmem_num; k++)
+						WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
+					netmem_num = 0;
+					xa_lock_bh(&sk->sk_user_frags);
+				}
+				ret++;
+			}
+		}
+	}
+
+	xa_unlock_bh(&sk->sk_user_frags);
+	for (k = 0; k < netmem_num; k++)
+		WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
+
+	kvfree(tokens);
+	return ret;
+}
+#endif
+
 void sockopt_lock_sock(struct sock *sk)
 {
 	/* When current->bpf_ctx is set, the setsockopt is called from
@@ -1211,6 +1268,10 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 			ret = -EOPNOTSUPP;
 		return ret;
 		}
+#ifdef CONFIG_PAGE_POOL
+	case SO_DEVMEM_DONTNEED:
+		return sock_devmem_dontneed(sk, optval, optlen);
+#endif
 	}
 
 	sockopt_lock_sock(sk);
-- 
2.45.2.505.gda0bf45e8d-goog


